//
//  RequestManager.m
//  YaoYDCoach2
//
//  Created by YM on 15/12/8.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "RequestManager.h"
#import "RequestFactroy.h"
#import "APPMacro.h"

#import <MJExtension.h>

@interface RequestManager ()

@property (nonatomic,copy,nonnull)  SuccessBlock successBlock;

@property (nonatomic,copy,nonnull)  FailureBlock failureBlock;

@end

@implementation RequestManager

+ (instancetype)shareManager{
    static dispatch_once_t onceToken;
    static RequestManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [[RequestManager alloc] init];
        
        //请求成功的处理方式
        manager.successBlock = ^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject,SuccessCallBack _Nullable completeBlock){
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            id dateDic = [NSJSONSerialization JSONObjectWithData:responseObject options:(NSJSONReadingMutableLeaves) error:nil];
            
             APILog(@"operation.name ->%@",operation.name);
             APILog(@"operation.response ->%@",operation.response);
            
            completeBlock?completeBlock(dateDic):nil;
        };
        
        //请求失败的处理方式
        manager.failureBlock = ^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error,FailureCallBack _Nullable completeBlock){
            
            APILog(@"\n\nerror   ->%@",error);
            
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            
            ErrorResposeModel *errorModel = [manager handleErrorResponseOperation:operation];
            
            completeBlock?completeBlock(errorModel):nil;
        };
        
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    });
    return manager;
}

#pragma mark -==========文本请求==========

- (void)GetRequsetWithUrl:(NSString * _Nonnull)url withParms:(NSDictionary *_Nullable)para success:(SuccessCallBack _Nullable)success failure:(FailureCallBack _Nullable)failure{
    
    [self GetRequsetWithUrl:url withParms:para withHeaders:[self defaultHeaders] success:success failure:failure];
    
}

- (void)GetRequsetWithUrl:(NSString * _Nonnull)url withParms:(NSDictionary *_Nullable)para withHeaders:(NSDictionary *_Nullable)headers success:(SuccessCallBack _Nullable)success failure:(FailureCallBack _Nullable)failure{
    
    [self packageTextRequestWithUrl:url withParms:para withHeaders:headers withType:(RequsetTypeGet) success:success failure:failure];

}

- (void)PostRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para success:(SuccessCallBack)success failure:(FailureCallBack)failure{
    [self PostRequsetWithUrl:url withParms:para withHeaders:[self defaultHeaders] success:success failure:failure];
}

- (void)PostRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHeaders:(NSDictionary *)headers success:(SuccessCallBack)success failure:(FailureCallBack)failure{
    
    [self packageTextRequestWithUrl:url withParms:para withHeaders:headers withType:(RequsetTypePost) success:success failure:failure];
}

- (void)PutRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para success:(SuccessCallBack)success failure:(FailureCallBack)failure{
    [self PutRequsetWithUrl:url withParms:para withHeaders:[self defaultHeaders] success:success failure:failure];
}

- (void)PutRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHeaders:(NSDictionary *)headers success:(SuccessCallBack)success failure:(FailureCallBack)failure{
    
   [self packageTextRequestWithUrl:url withParms:para withHeaders:headers withType:(RequsetTypePut) success:success failure:failure];
}

- (void)DeleteRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para success:(SuccessCallBack)success failure:(FailureCallBack)failure{
    [self DeleteRequsetWithUrl:url withParms:para withHeaders:[self defaultHeaders] success:success failure:failure];
};

- (void)DeleteRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHeaders:(NSDictionary *)headers success:(SuccessCallBack)success failure:(FailureCallBack)failure{
    
    [self packageTextRequestWithUrl:url withParms:para withHeaders:headers withType:(RequsetTypeDelete) success:success failure:failure];

}

/**
 *  文本类型网络请求
 *
 *  @param url     请求地址
 *  @param para    参数类型
 *  @param headers 请求头
 *  @param type    请求类型
 *  @param success 成功回调
 *  @param failure 失败回调
 */
- (void)packageTextRequestWithUrl:(NSString *)url withParms:(NSDictionary *)para withHeaders:(NSDictionary *)headers withType:(RequsetType)type success:(SuccessCallBack)success failure:(FailureCallBack)failure{
    
    //判断网络是否链接
    if(![self shouldGoQuery]){
        return;
    }
    
    //封装Request
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    NSMutableURLRequest *requset = nil;
    
    //改造URL
    NSString *urlString = url;
    if (![url hasPrefix:@"http"]) {
        urlString = [NSString stringWithFormat:@"%@%@",BASE_URL,url];
    }
    
    switch (type) {
        case RequsetTypeGet:
        {
            requset = [serializer requestWithMethod:@"GET" URLString:urlString parameters:para error:nil];
        }
            break;
        case RequsetTypePost:
        {
            requset = [serializer requestWithMethod:@"POST" URLString:urlString parameters:para error:nil];
        }
            break;
        case RequsetTypePut:
        {
            requset = [serializer requestWithMethod:@"PUT" URLString:urlString parameters:para error:nil];
        }
            break;
        case RequsetTypeDelete:
        {
            requset = [serializer requestWithMethod:@"DELETE" URLString:urlString parameters:para error:nil];
        }
            break;
    }
    
    //配置请求头
    for (NSString *key in headers) {
        [requset setValue:headers[key] forHTTPHeaderField:key];
    }
#warning      配置通用请求头 

    
    __weak typeof(self) weakSelf = self;
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:requset];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        weakSelf.successBlock(operation,responseObject,success);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        weakSelf.failureBlock(operation,error,failure);
    }];
    
    [RequestFactroy addOpertaion:op];
}

#pragma mark -==========上传文件==========
- (void)UpLoadFileWithUrl:(NSString *)url withParms:(NSDictionary *)para withFileBlock:(FormDataBlock)fileBlock success:(SuccessCallBack)success failure:(FailureCallBack)failure{
    [self UpLoadFileWithUrl:url withParms:para withFileBlock:fileBlock withUploadProgress:nil  success:success failure:failure];
}

- (void)UpLoadFileWithUrl:(NSString *)url withParms:(NSDictionary *)para withFileBlock:(FormDataBlock)fileBlock withUploadProgress:(UploadProgressBlock)progress success:(SuccessCallBack)success failure:(FailureCallBack)failure{
     [self UpLoadFileWithUrl:url withParms:para withFileBlock:fileBlock withUploadProgress:progress success:success failure:failure];
}

- (void)UpLoadFileWithUrl:(NSString *)url withParms:(NSDictionary *)para withHeaders:(NSDictionary *)headers withFileBlock:(FormDataBlock)fileBlock withUploadProgress:(UploadProgressBlock)progress success:(SuccessCallBack)success failure:(FailureCallBack)failure{
    __weak typeof(self) weakSelf = self;

    AFHTTPRequestOperationManager *manager = [self operationManagerWithHeaders:nil];
    AFHTTPRequestOperation *op = [manager POST:url parameters:para constructingBodyWithBlock:fileBlock
          success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
              weakSelf.successBlock(operation,responseObject,success);
          } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
              weakSelf.failureBlock(operation,error,failure);
          }];
    [op setUploadProgressBlock:progress];
    [RequestFactroy addOpertaion:op];
}

#pragma mark -==========下载文件==========

- (NSOperation *)DownloadFileWithUrl:(NSString *)url withParams:(NSDictionary *)paras savedPath:(NSString *)savedPath downloadSuccess:(SuccessCallBack)success downloadFailure:(FailureCallBack)failure progress:(UploadProgressBlock)progress{
    __weak typeof(self) weakSelf = self;
  
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    NSMutableURLRequest *requset = [serializer requestWithMethod:@"POST" URLString:url parameters:paras error:nil];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:requset];
    [op setOutputStream:[NSOutputStream outputStreamToFileAtPath:savedPath append:NO]];
    [op setDownloadProgressBlock:progress];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        weakSelf.successBlock(operation,responseObject,success);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        weakSelf.failureBlock(operation,error,failure);
    }];
    [op start];
    return  op;
}

#pragma mark -==========helper==========

/**
 *  默认的请求头信息
 *
 *  @return 默认的请求头信息
 */
- (NSDictionary *)defaultHeaders{
#warning      配置默认请求头

    return @{};
}

/**
 *  配置请求头
 *
 *  @param headers 请求头信息
 *
 *  @return AFHTTPRequestOperationManager
 */
- (AFHTTPRequestOperationManager *)operationManagerWithHeaders:(NSDictionary *)headers{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    for (NSString *key in [headers allKeys]) {
        [manager.requestSerializer setValue:headers[key] forHTTPHeaderField:key];
    }
    
     APILog(@"%s %@",__func__,manager.requestSerializer.HTTPRequestHeaders);
    
    return manager;
}

/**
 *  处理错误的响应信息
 *
 *  @param op 操作
 */
- (ErrorResposeModel *)handleErrorResponseOperation:(AFHTTPRequestOperation *)operation{
    id data = nil;
    ErrorResposeModel *model = [ErrorResposeModel noNetResponse];
    if (operation.responseData) {
        data = [NSJSONSerialization JSONObjectWithData:operation.responseData options:(NSJSONReadingMutableLeaves) error:nil];
        if (data) {
            model = [ErrorResposeModel objectWithKeyValues:data];
        }
    }
     APILog(@"operation.responseData ->%@",data);
    return model;
}

/**
 *  是否进行网络请求
 *
 *  @return 网络监听状态
 */
- (BOOL)shouldGoQuery {
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == 0) {
        [[NSNotificationCenter defaultCenter]
         postNotificationName:kNotificationNoNetWorkStatus object:nil];
        return NO;
    }
    return YES;
}

@end
