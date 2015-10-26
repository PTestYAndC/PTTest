//
//  BaseAPIWork.h
//
//  Created by YM on 15/10/25.
//  Copyright © 2015年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>




#ifdef DEBUG  // 调试状态
// 打开LOG功能
#define APILog(...) NSLog(__VA_ARGS__)
#else  // 发布状态
// 关闭LOG功能
#define APILog(...)
#endif

#define APILogInfo(url,response,dateDic) \
                        (APILog(@"\n/*\n/*\n/*\n/*\n%@ \nresponse-->%@ \n%@ \n*/\n*/\n*/\n*/ \n ",url,response,dateDic));

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



@end
