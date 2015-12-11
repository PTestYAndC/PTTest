//
//  BaseAPIWork.h
//
//  Created by YM on 15/10/25.
//  Copyright © 2015年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BaseRequestConfig.h"
#import "APPMacro.h"





@interface BaseAPIWork : NSObject

+ (instancetype)defaultWork;

#pragma mark -————————————————-网络操作基础————————————————
/**
 *  添加简单文本请求到队列中
 *
 *  @param request 请求对象
 *  @param success 成功回调
 *  @param failure 失败回调
 */
- (void)addRequest:(NSMutableURLRequest *)request success:(void (^)(id))success failure:(void (^)(id))failure;


- (void)addRequest1:(NSMutableURLRequest *)request success:(void (^)(id))success failure:(void (^)(id))failure;


@end
