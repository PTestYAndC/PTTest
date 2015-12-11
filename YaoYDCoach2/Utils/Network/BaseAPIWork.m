//
//  BaseAPIWork.m
//
//  Created by YM on 15/10/25.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "BaseAPIWork.h"
#import <AFNetworking.h>
#import "ErrorResposeModel.h"
#import <MJExtension.h>
#import <objc/runtime.h>

@interface BaseAPIWork ()
@property (nonatomic,strong) NSOperationQueue *apiQueue;
@end

@implementation BaseAPIWork

+ (instancetype)defaultWork {
    static BaseAPIWork *apiWork = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        apiWork = [[self alloc] init];
        apiWork.apiQueue = [[NSOperationQueue alloc] init];
        apiWork.apiQueue.maxConcurrentOperationCount = 3;
        
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
        [[NSNotificationCenter defaultCenter] addObserver:apiWork selector:@selector(cancelRequsetInVC:) name:kNotificationCancelRequsetsInVC object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:apiWork selector:@selector(cancelAllRequset) name:kNotificationCancelAllRequsets object:nil];
    });
    return apiWork;
}

- (id)init {
    if (self = [super init]) {
        
//        SEL systemSel = @selector(addRequest:success:failure:);
//        SEL swizzSel = @selector(addRequest1:success:failure:);
//
//        Method systemMethod = class_getInstanceMethod([self class], systemSel);
//        Method swizzMethod = class_getInstanceMethod([self class], swizzSel);
        
//        method_exchangeImplementations(systemMethod, swizzMethod);
        
    }
    return self;
}



#pragma mark -————————————————-网络操作基础————————————————
/**
*  添加简单文本请求到队列中
*
*  @param request 请求对象
*  @param success 成功回调
*  @param failure 失败回调
*/
- (void)addRequest:(NSMutableURLRequest *)request success:(void (^)(id))success failure:(void (^)(id))failure{
//    
//    NSData *d = request.HTTPBody;
//    NSString *ccc = [[NSString alloc] initWithData:d  encoding:NSUTF8StringEncoding];
//    NSLog(@"ccc %@",ccc);
//    [request setValue:@"ios_coach" forHTTPHeaderField:@"1yd_source"];
//    [request setValue:kAppVersion forHTTPHeaderField:@"1yd_version"];
//    
//    if (![self shouldGoQuery]) {
//        if (failure) {
//            failure(kErrorNetMsgDic);
//        }
//        return;
//    }
//    
//    APILog(@"/**\n/**\n/**\nrequest:%@\n%@\nfileds:\n%@\n**/**/**/",request.HTTPMethod,request,request.allHTTPHeaderFields);
//
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
//    
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        
//        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        APILog(@"OK -> %@", str);
//        if(connectionError || !data){
//            failure(kErrorNetMsgDic);
//            return ;
//        }
//        
//        id dateDic = [NSJSONSerialization JSONObjectWithData:data
//                                                     options:NSJSONReadingMutableContainers error:nil];
////        APILogInfo(response.URL.absoluteString,response,dateDic);
//        NSHTTPURLResponse *resp = (NSHTTPURLResponse *)response;
//        
//        /**
//         *  后台约定 成功状态码不仅仅200，故凡是小于400的都为成功
//         */
//        if (resp.statusCode < 400 && dateDic) {
//            success(dateDic);
//        }else{
//            failure(dateDic?:kErrorNetMsgDic);
//        }
//    }];
    

}


- (void)addRequest1:(NSMutableURLRequest *)request success:(void (^)(id))success failure:(void (^)(id))failure{
    
    
    if (![self shouldGoQuery]) {
        if (failure) {
            failure(kErrorNetMsgDic);
        }
        return;
    }

    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPRequestOperation *op = [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        id dateDic = responseObject;
     
        APILog(@"operation.response ->%@",operation.response);
        if (success) {
            success(dateDic);
        }
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        APILog(@"\n\nerror   ->%@",error);

        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        ErrorResposeModel *errorModel = [self handleErrorResponseOperation:operation];
        if (failure) {
            failure(errorModel);
        }
    }];
    op.name = [[NSUserDefaults standardUserDefaults] objectForKey:CurrentVC];
    [_apiQueue addOperation:op];
}

#pragma mark - Helper
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


//是否进行网络请求
- (BOOL)shouldGoQuery {
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == 0) {
        return NO;
    }
    return YES;
}

//取消所在VC的所有请求
- (void)cancelRequsetInVC:(NSNotification *)notification{
    NSString *classString = notification.object ;
    NSArray *opArray = [_apiQueue operations];
    for (AFHTTPRequestOperation *op in opArray) {
        if ([op.name isEqualToString:classString]) {
            [op cancel];
        }
    }
}

//取消所有请求
- (void)cancelAllRequset{
    [_apiQueue cancelAllOperations];
}



@end
