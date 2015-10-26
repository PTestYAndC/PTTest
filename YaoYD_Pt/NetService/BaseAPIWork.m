//
//  BaseAPIWork.m
//
//  Created by YM on 15/10/25.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "BaseAPIWork.h"
#import <AFNetworking.h>
#import <MJExtension.h>
#import "ErrorResposeModel.h"
#import "BaseRequestConfig.h"

@implementation BaseAPIWork

+ (instancetype)defaultWork {
    static BaseAPIWork *apiWork = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        apiWork = [[self alloc] init];
    });
    return apiWork;
}

- (id)init {
    if (self = [super init]) {
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
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session             = [NSURLSession sessionWithConfiguration:config delegate:nil
                                                                 delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                [[UIApplication sharedApplication]
                                                 setNetworkActivityIndicatorVisible:NO];
                                                
                                                NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                NSLog(@"OK -> %@", str);
                                                if(error || !data){
                                                    failure(kErrorNetMsgDic);
                                                    return ;
                                                }
                                                
                                                id dateDic = [NSJSONSerialization JSONObjectWithData:data
                                                                                             options:NSJSONReadingMutableContainers error:nil];
                                                APILogInfo(response.URL.absoluteString,response,dateDic);
                                                NSHTTPURLResponse *resp = (NSHTTPURLResponse *)response;
                                                if (resp.statusCode == 200 && dateDic) {
                                                    success(dateDic);
                                                }else{
                                                    failure(dateDic?:kErrorNetMsgDic);
                                                }
                                            }];
    
    [task resume];
}



@end
