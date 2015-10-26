//
//  NSString+Categroies.h
//  YaoYD
//
//  Created by Tianjian on 15/9/30.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>

#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#pragma mark - 常用计算
#define select(condition,vTrue,vFalse)                         ((condition)?(vTrue):(vFalse))

#pragma mark - 系统属性
/**
 *  状态栏高度
 */
#define STATUSBAR_HEIGHT                                    20
/**
 *  导航栏高度
 */
#define NAVGATIONBAR_HEIGHT                                 44

/**
 *  屏幕高度
 */
#define SCREEN_HEIGHT                                       [UIScreen mainScreen].bounds.size.height
/**
 *  屏幕宽度
 */
#define SCREEN_WIDTH                                        [UIScreen mainScreen].bounds.size.width

#pragma mark 类型转换
/**
 *  格式化字符串
 */
#define fmts(fmt,...)                                      [NSString stringWithFormat:fmt, ##__VA_ARGS__]

/**
 *  BOOL 转换成NSNumber
 */
#define bton(bool)                                         [NSNumber numberWithBool:bool]

/**
 *  BOOL 转换成NSString
 */
#define btos(bool)                                         [NSString stringWithFormat:@"%d", bool]
/**
 *  NSInteger 转换成NSString
 */

#if __LP64__ || (TARGET_OS_EMBEDDED && !TARGET_OS_IPHONE)|| TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
#define itos(integer)                                      [NSString stringWithFormat:@"%ld", (long)integer]
#define uitos(integer)                                      [NSString stringWithFormat:@"%lu", (unsigned long)integer]
#else
#define itos(integer)                                      [NSString stringWithFormat:@"%d", integer]
#define uitos(integer)                                      [NSString stringWithFormat:@"%u", integer]
#endif

/**
 *  NSInteger 转换成NSNumber
 */
#define iton(integer)                                       [NSNumber numberWithInteger:integer]

/**
 *  CGFloat 转换成NSString
 */
#define ftos(flo)                                           [NSString stringWithFormat:@"%f", flo]

#define ftods(flo, numberOfDecimals)                        [NSString stringWithFormat:fmts(@"%%.%df",numberOfDecimals), flo]

/**
 *  float 转换成NSNumber
 */
#define fton(float)                                         [NSNumber numberWithFloat:float]

/**
 *   double 转换成NSNumber
 */
#define dton(double)                                        [NSNumber numberWithDouble:double]

/**
 *   BOOL 转换成NSNumber
 */
#define bton(bool)                                          [NSNumber numberWithBool:bool]

/**
 *  NSObject 转换成NSString
 */
#define otos(object)                                       [NSString stringWithFormat:@"%@", object]

/**
 *  NULL 转换成 空NSString
 */
#define ntoe(string)                                       [NSString emptyString:string]

/**
 *  NULL 转换成 NSNull
 */
#define ntonull(string)                                    select(string,string,[NSNull null])

/**
 *  格式化字符串
 */
#define ntodefault(string , deft)                          [string length]?string:deft

/**
 *  格式化字符串
 */
#define itoBS(integer)                                     [NSString stringWithByteSize:integer]

@interface NSString (Categroies)

/**
 *  有限宽度计算文本高度
 *
 *  @param font   字体
 *  @param height 宽度
 *
 *  @return 高度
 */
//- (CGFloat)heightWithFont:(UIFont*)font forWidth:(CGFloat)width;

/**
 *  有限高度计算文本宽度
 *
 *  @param font   字体
 *  @param height 高度
 *
 *  @return 宽度
 */
//- (CGFloat)widthWithFont:(UIFont*)font forHeight:(CGFloat)height;

@end
