//
//  RequestManager.h
//  YaoYDCoach2
//
//  Created by YM on 15/12/8.
//  Copyright © 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ErrorResposeModel.h"

#import <AFNetworking.h>

typedef NS_ENUM(NSUInteger, RequsetType) {
    RequsetTypeGet,
    RequsetTypePost,
    RequsetTypePut,
    RequsetTypeDelete
};

typedef void(^SuccessCallBack)(id _Nullable tokenParams);

typedef void(^FailureCallBack)(ErrorResposeModel  * _Nullable errorModel);

typedef void(^SuccessBlock)(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject,SuccessCallBack _Nullable completeBlock);

typedef void(^FailureBlock)(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error,FailureCallBack _Nullable completeBlock);

typedef void(^FormDataBlock)(id<AFMultipartFormData>  _Nonnull formData);

typedef void(^UploadProgressBlock)(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite);

@interface RequestManager : NSObject


+ (instancetype _Nonnull)shareManager;

#pragma mark -==========普通文本请求==========
/**
 *  GET请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param success 成功的回调
 *  @param failure 失败的回调
 */
- (void)GetRequsetWithUrl:(NSString * _Nonnull)url withParms:(NSDictionary *_Nullable)para success:(SuccessCallBack _Nullable)success failure:(FailureCallBack _Nullable)failure;

/**
 *  GET请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param headers 请求头
 *  @param success 成功的回调
 *  @param failure 失败的回调
 */
- (void)GetRequsetWithUrl:(NSString * _Nonnull)url withParms:(NSDictionary *_Nullable)para withHeaders:(NSDictionary *_Nullable)headers success:(SuccessCallBack _Nullable)success failure:(FailureCallBack _Nullable)failure;


/**
 *  POST请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param success 成功的回调
 *  @param failure 失败的回调
 */
- (void)PostRequsetWithUrl:(NSString * _Nonnull)url withParms:(NSDictionary *_Nullable)para success:(SuccessCallBack _Nullable)success failure:(FailureCallBack _Nullable)failure;

/**
 *  POST请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param headers 请求头
 *  @param success 成功的回调
 *  @param failure 失败的回调
 */
- (void)PostRequsetWithUrl:(NSString * _Nonnull)url withParms:(NSDictionary *_Nullable)para withHeaders:(NSDictionary *_Nullable)headers success:(SuccessCallBack _Nullable)success failure:(FailureCallBack _Nullable)failure;

/**
 *  PUT请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param success 成功的回调
 *  @param failure 失败的回调
 */
- (void)PutRequsetWithUrl:(NSString * _Nonnull)url withParms:(NSDictionary *_Nullable)para success:(SuccessCallBack _Nullable)success failure:(FailureCallBack _Nullable)failure;

/**
 *  PUT请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param headers 请求头
 *  @param success 成功的回调
 *  @param failure 失败的回调
 */
- (void)PutRequsetWithUrl:(NSString * _Nonnull)url withParms:(NSDictionary *_Nullable)para withHeaders:(NSDictionary *_Nullable)headers success:(SuccessCallBack _Nullable)success failure:(FailureCallBack _Nullable)failure;


/**
 *  DELETE请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param success 成功的回调
 *  @param failure 失败的回调
 */
- (void)DeleteRequsetWithUrl:(NSString * _Nonnull)url withParms:(NSDictionary *_Nullable)para success:(SuccessCallBack _Nullable)success failure:(FailureCallBack _Nullable)failure;

/**
 *  DELETE请求
 *
 *  @param url     请求地址
 *  @param para    请求参数
 *  @param headers 请求头
 *  @param success 成功的回调
 *  @param failure 失败的回调
 */
- (void)DeleteRequsetWithUrl:(NSString * _Nonnull)url withParms:(NSDictionary *_Nullable)para withHeaders:(NSDictionary *_Nullable)headers success:(SuccessCallBack _Nullable)success failure:(FailureCallBack _Nullable)failure;

#pragma mark -==========上传文件==========

/**
 *  上传文件请求
 *
 *  @param url       请求地址
 *  @param para      请求参数
 *  @param fileBlock 文件配置Block
 *  @param success   成功的回调
 *  @param failure   失败的回调
 */
- (void)UpLoadFileWithUrl:(NSString *_Nonnull)url withParms:(NSDictionary *_Nullable)para withFileBlock:(FormDataBlock _Nullable)fileBlock success:(SuccessCallBack _Nullable)success failure:(FailureCallBack _Nullable)failure;

/**
 *  上传文件请求
 *
 *  @param url       请求地址
 *  @param para      请求参数
 *  @param fileBlock 文件配置Block
 *  @param progress  上传进度Block
 *  @param success   成功的回调
 *  @param failure   失败的回调
 */
- (void)UpLoadFileWithUrl:(NSString *_Nonnull)url withParms:(NSDictionary * _Nullable)para withFileBlock:(FormDataBlock _Nullable)fileBlock withUploadProgress:(UploadProgressBlock _Nullable)progress success:(SuccessCallBack _Nullable)success failure:(FailureCallBack _Nullable)failure;

/**
 *  上传文件请求
 *
 *  @param url       请求地址
 *  @param para      请求参数
 *  @param headers   请求头
 *  @param fileBlock 文件配置Block
 *  @param progress  上传进度Block
 *  @param success   成功的回调
 *  @param failure   失败的回调
 */
- (void)UpLoadFileWithUrl:(NSString *_Nonnull)url withParms:(NSDictionary *_Nullable)para withHeaders:(NSDictionary *_Nullable)headers withFileBlock:(FormDataBlock _Nullable)fileBlock withUploadProgress:(UploadProgressBlock _Nullable)progress success:(SuccessCallBack _Nullable)success failure:(FailureCallBack _Nullable)failure;

#pragma mark -==========下载文件==========

/**
 *  下载文件的请求
 *
 *  @param url       请求地址
 *  @param paras     请求参数
 *  @param savedPath 文件保存路径
 *  @param success   成功的回调
 *  @param failure   失败的回调
 *  @param progress  下载进度Block
 *
 *  @return 返回下载操作
 */
- (NSOperation * _Nonnull)DownloadFileWithUrl:(NSString * _Nonnull)url withParams:(NSDictionary * _Nullable)para savedPath:(NSString * _Nonnull)savedPath downloadSuccess:(SuccessCallBack _Nullable)success downloadFailure:(FailureCallBack _Nullable)failure progress:(UploadProgressBlock _Nullable)progress;

@end
