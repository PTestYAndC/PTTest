//
//  ApiMacro.h
//  JJ
//
//  Created by YM on 15/11/12.
//  Copyright © 2015年 YM. All rights reserved.
//

/**
 *  接口相关的宏定义，定义Url
 */
#ifndef ApiMacro_h
#define ApiMacro_h



#ifdef IOS_DEBUG
//Debug状态下的测试API
#define BASE_URL     @"https://tenant-api-test.1yd.me"
#else
//Release状态下的线上API
#define BASE_URL     @"https://tenant-api-test.1yd.me"

#endif



#ifdef IOS_DEBUG  // 调试状态
// 打开LOG功能
#define APILog(...) NSLog(__VA_ARGS__)
#else  // 发布状态
// 关闭LOG功能
#define APILog(...)
#endif

#define APILogInfo(url,response,dateDic) \( APILog(@"\n/*\n/*\n/*\n/*\n%@ \nresponse-->%@ \n%@ \n*/\n*/\n*/\n*/ \n ",url,response,dateDic) );


#pragma mark -----首页模块

#define kApiCities  @"/api/open/cities"

#pragma mark -----设置模块

#pragma mark -----登录注册模块




#endif /* ApiMacro_h */
