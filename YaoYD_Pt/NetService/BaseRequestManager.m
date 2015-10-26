//
//  BaseRequestManager.m
//
//  Created by YM on 15/10/22.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "BaseRequestManager.h"


#import "BaseAPIWork.h"
#import "BaseRequestConfig.h"
//请求方式
typedef NS_ENUM(NSUInteger, RequestType) {
    RequestTypeGet = 100,       // GET      请求方式
    RequestTypePost,            // POST     请求方式
    RequestTypePut,             // PUT      请求方式
    RequestTypeDelete,          // DELEGATE 请求方式
    
    RequestTypeUpLoad,          //上传图片
};
@interface BaseRequestManager ()<NSURLSessionDelegate>

@end

@implementation BaseRequestManager

+ (instancetype)manager {
    static BaseRequestManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
    }
    return self;
}



#pragma mark ——————————————暴露方法----GET、POST、PUT、DELETE-————————————————
/**
 *  Get请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)GetRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para success:(void (^)(id))success failure:(void (^)(id data))failure{
    
    [BaseRequestManager GetRequsetWithUrl:url withParms:para withHTTPHeaderFields:
     [BaseRequestConfig defaultHttpHarders] success:success failure:failure];
}

+ (void)GetRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHTTPHeaderFields:(NSDictionary *)fields success:(void (^)(id))success failure:(void (^)(id))failure{
    BaseRequestManager *manager = [BaseRequestManager manager];
    //转化param追加到url后面
    if (para) {
        NSString *tempParams = [manager stringWithDic:para];
        NSRange range = [url rangeOfString:@"?"];//判断字符串是否包含
        if (range.location ==NSNotFound){//不包含
            url = [url stringByAppendingFormat:@"?%@",tempParams];
        }else{
            url = [url stringByAppendingFormat:@"&%@",tempParams];
        }
    }
    
    [manager requestWithUrl:url withParms:nil withRequestType:(RequestTypeGet) multimediaFile:nil withHTTPHeaderFields:fields  success:^(id dic) {
        success(dic);
    } failure:^(id dic) {
        failure(dic);
    }];
}


/**
 *  POST请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)PostRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para success:(void (^)(id))success failure:(void (^)(id))failure{
    
    [BaseRequestManager PostRequsetWithUrl:url withParms:para withHTTPHeaderFields:[BaseRequestConfig defaultHttpHarders] success:success failure:failure];
}

+ (void)PostRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHTTPHeaderFields:(NSDictionary *)fields success:(void (^)(id))success failure:(void (^)(id))failure{
    
    BaseRequestManager *manager = [BaseRequestManager manager];
    [manager requestWithUrl:url withParms:para withRequestType:(RequestTypePost) multimediaFile:nil withHTTPHeaderFields:fields success:^(id dic) {
        success(dic);
    } failure:^(id dic) {
        failure(dic);
    }];

}


/**
 *  PUT请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)PutRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para success:(void (^)(id))success failure:(void (^)(id))failure{
    
    [BaseRequestManager PostRequsetWithUrl:url withParms:para withHTTPHeaderFields:[BaseRequestConfig defaultHttpHarders] success:success failure:failure];
}

+ (void)PutRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHTTPHeaderFields:(NSDictionary *)fields success:(void (^)(id))success failure:(void (^)(id))failure{
    
    BaseRequestManager *manager = [BaseRequestManager manager];
    [manager requestWithUrl:url withParms:para withRequestType:(RequestTypePut) multimediaFile:nil withHTTPHeaderFields:fields success:^(id dic) {
        success(dic);
    } failure:^(id dic) {
        failure(dic);
    }];
}

/**
 *  DELETE请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)DeleteRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para success:(void (^)(id))success failure:(void (^)(id))failure{
    
    [BaseRequestManager DeleteRequsetWithUrl:url withParms:para withHTTPHeaderFields:[BaseRequestConfig defaultHttpHarders]success:success failure:failure];
}

+ (void)DeleteRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHTTPHeaderFields:(NSDictionary *)fields success:(void (^)(id))success failure:(void (^)(id))failure{
    BaseRequestManager *manager = [BaseRequestManager manager];
    [manager requestWithUrl:url withParms:para withRequestType:(RequestTypeDelete) multimediaFile:nil withHTTPHeaderFields:nil success:^(id dic) {
        success(dic);
    } failure:^(id dic) {
        failure(dic);
    }];
}


+ (void)UpdateImageRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withImage:(UIImage *)image success:(void (^)(id))success failure:(void (^)(id))failure{
    [BaseRequestManager UpdateImageRequsetWithUrl:url withParms:para withHTTPHeaderFields:[BaseRequestConfig defaultHttpHarders] withImage:image success:success failure:failure];
}

+ (void)UpdateImageRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHTTPHeaderFields:(NSDictionary *)fields withImage:(UIImage *)image success:(void (^)(id))success failure:(void (^)(id))failure{
    BaseRequestManager *manager = [BaseRequestManager manager];
    [manager requestWithUrl:url withParms:para withRequestType:(RequestTypeUpLoad) multimediaFile:image withHTTPHeaderFields:nil success:^(id dic) {
        success(dic);
    } failure:^(id dic) {
        failure(dic);
    }];
}



#pragma mark ————————————————————工具方法————————————————————

/**
 *  封装纯文本Request对象
 *
 *  @param url  请求地址
 *  @param para 请求参数
 *  @param type 请求的方式
 *
 *  @return 封装好的Request对象
 */
- (NSMutableURLRequest *)packageTextRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withRequestType:(RequestType)type withHTTPHeaderFields:(NSDictionary *)fields{
    
    NSURL *url1 =  [NSURL URLWithString:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url1 cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    switch (type) {
        case RequestTypeGet:    {request.HTTPMethod = @"GET";}      break;
        case RequestTypePost:   {request.HTTPMethod = @"POST";}     break;
        case RequestTypePut:    {request.HTTPMethod = @"PUT";}      break;
        case RequestTypeDelete: {request.HTTPMethod = @"DELETE";}   break;
        case RequestTypeUpLoad: {request.HTTPMethod = @"POST";}   break;

        default:break;
    }
    
    if (para) {
        
        NSString *tempParams = [self stringWithDic:para];
        NSData *bodyData = [tempParams dataUsingEncoding:(NSUTF8StringEncoding)];
        //设置请求体
        [request setHTTPBody:bodyData];
    }

    //将HTTPHeaderField添加到HTTPHeaderField 中
    if (fields) {
        for (NSString *keyString in [fields allKeys]) {
            [request setValue:fields[keyString] forHTTPHeaderField:keyString];
        }
    }
    return request;
}



- (NSMutableURLRequest *)packageUploadRequestWithUrl:(NSString *)url withParms:(NSDictionary *)params multimediaFile:(id)multFile withHTTPHeaderFields:(NSDictionary *)fields {
    
    NSString *uploadPath = url;

    NSMutableURLRequest *myRequest = [ [NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString:uploadPath] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:0];
    [myRequest setHTTPMethod:@"POST"];
    [myRequest setValue:[@"multipart/form-data; boundary=" stringByAppendingString:BOUNDARY] forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    for(NSString *key in params) {
        id content = [params objectForKey:key];
        if ([content isKindOfClass:[NSString class]] || [content isKindOfClass:[NSNumber class]]) {
            NSString *param = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\"\r\n\r\n%@\r\n",BOUNDARY,key,content,nil];
            [body appendData:[param dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
    
    
    NSData *file = UIImageJPEGRepresentation(multFile, 0.5);
    NSString *param = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\";filename=\"%@\"\r\nContent-Type: application/octet-stream\r\n\r\n",BOUNDARY,kImageServicerName,kImageServicerFileName,nil];
    [body appendData:[param dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:file];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSString *endString = [NSString stringWithFormat:@"--%@--",BOUNDARY];
    [body appendData:[endString dataUsingEncoding:NSUTF8StringEncoding]];
    [myRequest setHTTPBody:body];
    
    for (NSString *keyString in [fields allKeys]) {
        [myRequest setValue:fields[keyString] forHTTPHeaderField:keyString];
    }
    
    return myRequest;
}



/**
 *  所有的网络请求都调用此方法
 *
 *  @param url
 *  @param para    参数
 *  @param type    请求类型
 *  @param success 成功的回调
 *  @param failure 失败的回调
 */
- (void)requestWithUrl:(NSString *)url withParms:(NSDictionary *)para withRequestType:(RequestType)type multimediaFile:(id)multFile withHTTPHeaderFields:(NSDictionary *)fields  success:(void (^)(id))success failure:(void (^)(id))failure
{
    NSString *urlString = url;
    if (![url hasPrefix:@"http"]) {
        urlString = [NSString stringWithFormat:@"%@%@",BaseUrl,url];
    }
    
    //包装requset对象
    NSMutableURLRequest *request = nil;
    
    switch (type) {
        case RequestTypeGet:
        case RequestTypePost:
        case RequestTypePut:
        case RequestTypeDelete:
        {
            //放入request
            request = [self packageTextRequsetWithUrl:urlString withParms:para withRequestType:type  withHTTPHeaderFields:fields];
            request.timeoutInterval = kRequestTimeout;
            [[BaseAPIWork defaultWork] addRequest:request success:success failure:failure];
        }
            break;
        case RequestTypeUpLoad:{
            request = [self packageUploadRequestWithUrl:urlString withParms:para multimediaFile:multFile withHTTPHeaderFields:fields];
            request.timeoutInterval = kRequestTimeout;
            [[BaseAPIWork defaultWork] addRequest:request success:success failure:failure];
            
        }break;
            
        default:
            break;
    }
    
}



/**
 *  字典转化成string
 *
 *  @param dic 源字典
 *
 *  @return 转化后的string
 */
- (NSString *)stringWithDic:(NSDictionary *)dic{
    NSString *tempParams = [NSString string];
    
    for (NSString *keyString in [dic allKeys]) {
        tempParams =
        [tempParams stringByAppendingFormat:@"%@=%@&",keyString,dic[keyString]];
    }
    
    tempParams = [tempParams substringToIndex:tempParams.length - 1];
    return tempParams;
}

/**
 *  默认的 HttpField
 *
 *  @return 返回 默认的 HttpField
 */
- (NSDictionary *)defaultHttpField{
#warning 根据具体情况设定
    return nil;
}




@end
