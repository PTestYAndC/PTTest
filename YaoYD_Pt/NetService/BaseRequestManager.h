//
//  BaseRequestManager.h
//
//  Created by YM on 15/10/22.
//  Copyright © 2015年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  BaseRequestManager 用法简介
    BaseRequestManager为app请求管理类，封装了常用的4类请求和图片上传的方法。依赖于BaseRequestConfig类，
    根据现有需求 满足以下两点
    1，配置请求路径。默认url,若请求URL前缀为默认设置的 ，则只需设置后面连接地址即可
    例如
        [BaseRequestManager GetRequsetWithUrl:@"/api/coach/pciture/332" withParms:nil success:nil failure:nil];
    若为需要特殊处理的url,则需把完整路径作为参数传递
        [BaseRequestManager GetRequsetWithUrl:@"https://www.baidu.com" withParms:nil success:nil failure:nil];
    2,配置请求头。传递默认请求头无需特别处理
        [BaseRequestManager GetRequsetWithUrl:@"/api/coach/pciture/332" withParms:nil success:nil failure:nil];
    若需要填写特别的请求头，则需要自己将所有需传递的请求参数填写完整。
        [BaseRequestManager GetRequsetWithUrl:@"/se/e" withParms:nil 
                            withHTTPHeaderFields:@{@"change":@"iOS" }  success:nil failure:nil];
    默认请求头配置：常用配置（具体需求待确定）
 */


@interface BaseRequestManager : NSObject

+ (instancetype)manager ;

/**
 *  Get请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)GetRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para success:(void (^)(id responseData))success failure:(void (^)(id responseData))failure;


/**
 *  Get请求 追加HTTPHeaderFields参数
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param fields  特殊的HTTPHeaderFields设置
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)GetRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHTTPHeaderFields:(NSDictionary *)fields success:(void (^)(id responseData))success failure:(void (^)(id responseData))failure;

/**
 *  POST请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)PostRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para success:(void (^)(id responseData))success failure:(void (^)(id responseData))failure;


/**
 *  POST请求 追加HTTPHeaderFields参数
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param fields  特殊的HTTPHeaderFields设置
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)PostRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHTTPHeaderFields:(NSDictionary *)fields success:(void (^)(id responseData))success failure:(void (^)(id responseData))failure;


/**
 *  PUT请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)PutRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para success:(void (^)(id responseData))success failure:(void (^)(id responseData))failure;

/**
 *  PuT请求 追加HTTPHeaderFields参数
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param fields  特殊的HTTPHeaderFields设置
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)PutRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHTTPHeaderFields:(NSDictionary *)fields success:(void (^)(id responseData))success failure:(void (^)(id responseData))failure;


/**
 *  DELETE请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)DeleteRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para success:(void (^)(id responseData))success failure:(void (^)(id responseData))failure;

/**
 *  DELETE请求 追加HTTPHeaderFields参数
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param fields  特殊的HTTPHeaderFields设置
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)DeleteRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHTTPHeaderFields:(NSDictionary *)fields success:(void (^)(id responseData))success failure:(void (^)(id responseData))failure;


/**
 *  上传图片请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param image   上传图片
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)UpdateImageRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withImage:(UIImage *)image success:(void (^)(id responseData))success failure:(void (^)(id responseData))failure;


/**
 *  上传图片请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param fields  特殊的HTTPHeaderFields设置
 *  @param image   上传图片
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)UpdateImageRequsetWithUrl:(NSString *)url withParms:(NSDictionary *)para withHTTPHeaderFields:(NSDictionary *)fields withImage:(UIImage *)image success:(void (^)(id responseData))success failure:(void (^)(id responseData))failure;


@end
