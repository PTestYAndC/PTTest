//
//  AppMacro.h
//  PT
//
//  Created by YM on 15/10/25.
//  Copyright © 2015年 YM. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

//默认账号测试控制 1-使用默认的账号，0 -不使用默认账号
#define TJTestUserID 0
//TalkingData 打印日志控制: 1 - 打印日志  0 - 关闭打印日志
#define TalkingDataLog 0
//NSLog信息控制: 1 - 打印信息  0 - 不打印信息
#define TJDebug 0
//产品环境控制  : Pro -1产线环境 Dev - 1Dev环境 Test - 1 测试环境
#define Pro  1
//#define Dev  1
//#define Test 1

#if TJDebug
#define NSLog(FORMAT, ...) fprintf(stderr,"%s第%d行,Content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

#if Pro //生产环境
#define BaseUrl_Coach         @"https://platform-api.1yd.me/"//备注
#define BaseUrl_UserAndOrder  @"https://platform-api.1yd.me/"
#define BaseUrl_Gyms          @"https://gyms-api.1yd.me/"
#elif Dev //Dev环境
#define BaseUrl_Coach         @"http://platform-api-dev.1yd.me/"//备注
#define BaseUrl_UserAndOrder  @"http://platform-api-dev.1yd.me/"
#define BaseUrl_Gyms          @"http://tenant-api-dev.1yd.me/"
#elif Test //测试环境
#define BaseUrl_Coach         @"http://platform-api-test.1yd.me/"//备注
#define BaseUrl_UserAndOrder  @"http://platform-api-test.1yd.me/"
#define BaseUrl_Gyms          @"http://tenant-api-test.1yd.me/"
#endif

#endif /* AppMacro_h */
