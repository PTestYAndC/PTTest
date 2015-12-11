//
//  AppConfigMacro.h
//  JJ
//
//  Created by YM on 15/11/12.
//  Copyright © 2015年 YM. All rights reserved.
//
/**
 *  定义APP常用配置文件
 */
#ifndef AppConfigMacro_h
#define AppConfigMacro_h

//是否为测试模式，正式模式将该行隐掉
#define IOS_DEBUG




#ifdef IOS_DEBUG
# define DLog(format, ...)  NSLog((@"[文件名:%s]" "[函数名:%s]" "[行号:%d]" format), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);

#define APILog(format, ...) NSLog((@"API->" "[函数名:%s]" "[行号:%d]" format), __FUNCTION__, __LINE__, ##__VA_ARGS__);

#else
# define DLog(...);

# define APILog(...);

#endif

#pragma mark -----目录相关
#define kPathTemp                   NSTemporaryDirectory()
#define kPathDocument               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kPathCache                  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]


#pragma mark -----屏幕尺寸相关
//屏幕 rect
#define SCREEN_RECT ([UIScreen mainScreen].bounds)

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#pragma mark -----系统判断
//System version utils
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

//大于等于7.0的ios版本
#define iOS7_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
//大于等于8.0的ios版本
#define iOS8_OR_LATER SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")
//iOS6时，导航VC中view的起始高度
#define YH_HEIGHT (iOS7_OR_LATER ? 64:0)



/**当前VC*/
#define CurrentVC @"CurrentVC"

#endif /* AppConfigMacro_h */
