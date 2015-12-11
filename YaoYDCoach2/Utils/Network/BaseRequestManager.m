//
//  BaseRequestManager.m
//
//  Created by YM on 15/10/22.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "BaseRequestManager.h"


#import "BaseAPIWork.h"
//请求方式
typedef NS_ENUM(NSUInteger, RequestType) {
    RequestTypeGet = 100,       // get      请求方式
    RequestTypePost,            // post     请求方式
    RequestTypePut,             // put      请求方式
    RequestTypeDelete,          // delete   请求方式
    
    RequestTypeUpLoad,          //上传文件
    
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
+ (void)GetRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para success:(void (^)(id))success failure:(void (^)(ErrorResposeModel *errorModel))failure{
    
    [BaseRequestManager GetRequsetWithUrl:url withParms:para withHTTPHeaderFields:
     [BaseRequestConfig defaultHttpHarders] success:success failure:failure];

}

+ (void)GetRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHTTPHeaderFields:(NSDictionary *)fields success:(void (^)(id))success failure:(void (^)(ErrorResposeModel *errorModel))failure{
    BaseRequestManager *manager = [BaseRequestManager manager];
    //转化param追加到url后面
    if (para) {
        NSString *tempParams = [manager urlStringWithDic:para];
        NSRange range = [url rangeOfString:@"?"];//判断字符串是否包含
        if (range.location ==NSNotFound){//不包含
            url = [url stringByAppendingFormat:@"?%@",tempParams];
        }else{
            url = [url stringByAppendingFormat:@"&%@",tempParams];
        }
    }
    
    [manager requestWithUrl:url withParms:nil withRequestType:RequestTypeGet withHTTPHeaderFields:fields success:^(id dic) {
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
+ (void)PostRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para success:(void (^)(id))success failure:(void (^)(ErrorResposeModel *errorModel))failure{
    
    [BaseRequestManager PostRequsetWithUrl:url withParms:para withHTTPHeaderFields:[BaseRequestConfig defaultHttpHarders] success:success failure:failure];
}

+ (void)PostRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHTTPHeaderFields:(NSDictionary *)fields success:(void (^)(id))success failure:(void (^)(ErrorResposeModel *errorModel))failure{
    
    BaseRequestManager *manager = [BaseRequestManager manager];
    [manager requestWithUrl:url withParms:para withRequestType:RequestTypePost withHTTPHeaderFields:fields success:^(id dic) {
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
+ (void)PutRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para success:(void (^)(id))success failure:(void (^)(ErrorResposeModel *errorModel))failure{
    
    [BaseRequestManager PutRequsetWithUrl:url withParms:para withHTTPHeaderFields:[BaseRequestConfig defaultHttpHarders] success:success failure:failure];
}

+ (void)PutRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHTTPHeaderFields:(NSDictionary *)fields success:(void (^)(id))success failure:(void (^)(ErrorResposeModel *errorModel))failure{
    
    BaseRequestManager *manager = [BaseRequestManager manager];
    [manager requestWithUrl:url withParms:para withRequestType:RequestTypePut withHTTPHeaderFields:fields success:^(id dic) {
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
+ (void)DeleteRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para success:(void (^)(id))success failure:(void (^)(ErrorResposeModel *errorModel))failure{
    
    [BaseRequestManager DeleteRequsetWithUrl:url withParms:para withHTTPHeaderFields:[BaseRequestConfig defaultHttpHarders] success:success failure:failure];
}

+ (void)DeleteRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHTTPHeaderFields:(NSDictionary *)fields success:(void (^)(id))success failure:(void (^)(ErrorResposeModel *errorModel))failure{
    BaseRequestManager *manager = [BaseRequestManager manager];
    [manager requestWithUrl:url withParms:para withRequestType:RequestTypeDelete withHTTPHeaderFields:fields success:^(id dic) {
        success(dic);
    } failure:^(id dic) {
        failure(dic);
    }];
}


+ (void)UpdateImageRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withImage:(UIImage *)image success:(void (^)(id))success failure:(void (^)(ErrorResposeModel *errorModel))failure{
    [BaseRequestManager UpdateImageRequsetWithUrl:url withParms:para withHTTPHeaderFields:[BaseRequestConfig defaultHttpHarders] withImage:image success:success failure:failure];
}

+ (void)UpdateImageRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHTTPHeaderFields:(NSDictionary *)fields withImage:(UIImage *)image success:(void (^)(id))success failure:(void (^)(ErrorResposeModel *errorModel))failure{
    
    
    BaseRequestManager *manager = [BaseRequestManager manager];
    
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    NSDictionary *configer = @{@"name"    :@"file",
                               @"fileName":@"photo.jpg"};
    [manager requestWithUrl:url withParms:para withRequestType:(RequestTypeUpLoad) multimediaFile:data withHTTPHeaderFields:fields  withFileConfiger:configer success:^(id dic) {
        success(dic);
    } failure:^(id dic) {
        failure(dic);
    }];
}


+ (void)UploadFileRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHTTPHeaderFields:(NSDictionary *)fields withFile:(__autoreleasing id )file withFileConfiger:(NSDictionary *)fileConfiger success:(void (^)(id))success failure:(void (^)(ErrorResposeModel *errorModel))failure{
    BaseRequestManager *manager = [BaseRequestManager manager];
    [manager requestWithUrl:url withParms:para withRequestType:RequestTypePost multimediaFile:file withHTTPHeaderFields:fields withFileConfiger:fileConfiger success:success failure:failure];
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
    
    NSString *urlString = [NSString stringWithFormat:@"%@",url];
    if (![url hasPrefix:@"http"]) {
        urlString = [NSString stringWithFormat:@"%@%@",BASE_URL,url];
    }
    
    NSString* webStringURL =
    [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
   
    NSURL *url1 =  [NSURL URLWithString:webStringURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url1 cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    switch (type) {
        case RequestTypeGet:    {request.HTTPMethod = @"GET";}      break;
        case RequestTypePost:   {request.HTTPMethod = @"POST";}     break;
        case RequestTypePut:    {request.HTTPMethod = @"PUT";}      break;
        case RequestTypeDelete: {request.HTTPMethod = @"DELETE";}   break;
        case RequestTypeUpLoad: {request.HTTPMethod = @"POST";}   break;
        default:break;
    }
    
    
    //将HTTPHeaderField添加到HTTPHeaderField 中
    if (fields) {
        for (NSString *keyString in [fields allKeys]) {
            [request setValue:fields[keyString] forHTTPHeaderField:keyString];
        }
    }
    
    if (para) {
        NSString *tempParams;
        if ([fields[@"Content-Type"] isEqualToString:@"application/x-www-form-urlencoded"]) {
            tempParams = [self urlStringWithDic:para];
        }else{
            tempParams = [self stringWithDic:para];
        }
        NSData *bodyData = [tempParams dataUsingEncoding:(NSUTF8StringEncoding)];
        //设置请求体
        [request setHTTPBody:bodyData];
    }

    return request;
}


/**
 *  封装特殊格式的requset
 *
 *  @param url      请求地址
 *  @param params   请求参数
 *  @param multFile 上传文件
 *  @param fields   请求头
 *
 *  @return 封装后的请求
 */
- (NSMutableURLRequest *)packageUploadRequestWithUrl:(NSString *)url withParms:(NSDictionary *)params multimediaFile:(NSData *)multFile withHTTPHeaderFields:(NSDictionary *)fields withFileConfiger:(NSDictionary *)configer{
    
    NSString *urlString = [NSString stringWithFormat:@"%@",url];
    if (![url hasPrefix:@"http"]) {
        urlString = [NSString stringWithFormat:@"%@%@",BASE_URL,url];
    }
    NSString *uploadPath = urlString;

    NSMutableURLRequest *myRequest = [ [NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString:uploadPath] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:0];
    [myRequest setHTTPMethod:@"POST"];
    
    
    NSMutableData *body = [NSMutableData data];
    for(NSString *key in params) {
        id content = [params objectForKey:key];
        if ([content isKindOfClass:[NSString class]] || [content isKindOfClass:[NSNumber class]]) {
            NSString *param = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\"\r\n\r\n%@\r\n",BOUNDARY,key,content,nil];
            [body appendData:[param dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
#warning 如果没有文件 不追加文件信息
    if (multFile) {
        NSString *param = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\";filename=\"%@\"\r\nContent-Type: application/octet-stream\r\n\r\n",BOUNDARY,configer[@"name"],configer[@"fileName"],nil];
        [body appendData:[param dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:multFile?:[NSData data]];
        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        NSString *endString = [NSString stringWithFormat:@"--%@--",BOUNDARY];
        [body appendData:[endString dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    
    [myRequest setHTTPBody:body];
    
    for (NSString *keyString in [fields allKeys]) {
        [myRequest setValue:fields[keyString] forHTTPHeaderField:keyString];
    }
    
    [myRequest setValue:[@"multipart/form-data; boundary=" stringByAppendingString:BOUNDARY] forHTTPHeaderField:@"Content-Type"];
    
    
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
- (void)requestWithUrl:(NSString *)url withParms:(NSDictionary *)para withRequestType:(RequestType)type multimediaFile:(id)multFile withHTTPHeaderFields:(NSDictionary *)fields  withFileConfiger:(NSDictionary *)configer success:(void (^)(id))success failure:(void (^)(ErrorResposeModel *errorModel))failure
{
    //包装requset对象
    NSMutableURLRequest *request = nil;
    
    switch (type) {
        case RequestTypeGet:
        case RequestTypePost:
        case RequestTypePut:
        case RequestTypeDelete:
        {
            //放入request
            request = [self packageTextRequsetWithUrl:url withParms:para withRequestType:type  withHTTPHeaderFields:fields];
            [[BaseAPIWork defaultWork] addRequest1:request success:success failure:failure];
        }
            break;
        case RequestTypeUpLoad:{
            request = [self packageUploadRequestWithUrl:url withParms:para multimediaFile:multFile withHTTPHeaderFields:fields withFileConfiger:configer];
            [[BaseAPIWork defaultWork] addRequest1:request success:success failure:failure];
        }break;
            
        default:
            break;
    }
    
}


- (void)requestWithUrl:(NSString *)url withParms:(NSDictionary *)para withRequestType:(RequestType)type  withHTTPHeaderFields:(NSDictionary *)fields  success:(void (^)(id))success failure:(void (^)(ErrorResposeModel *errorModel))failure{

    [self requestWithUrl:url withParms:para withRequestType:type multimediaFile:nil withHTTPHeaderFields:fields withFileConfiger:nil success:success failure:failure];
}




#pragma mark -helper------
/**
 *  字典转化成 JSON string
 *
 *  @param dic 源字典
 *
 *  @return 转化后的string
 */
- (NSString *)stringWithDic:(NSDictionary *)dic{
  
    NSData *json = [NSJSONSerialization dataWithJSONObject:dic
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:nil];
    
    NSString *string = [[NSString alloc] initWithData:json
                                             encoding:NSUTF8StringEncoding];
    
    return string;
}

/**
 *  字典转化成 URL string(用于Get请求拼接地址)
 *
 *  @param dic 源字典
 *
 *  @return 转化后的string
 */
- (NSString *)urlStringWithDic:(NSDictionary *)dic{
    
    NSString *tempString = [NSString string];
    for (NSString *keyString in [dic allKeys]) {
       tempString = [tempString stringByAppendingFormat:@"%@=%@&",keyString,dic[keyString]];
    }
    if ([tempString hasSuffix:@"&"]) {
        tempString = [tempString substringToIndex:tempString.length -1];
    }
    return tempString;
}

@end
