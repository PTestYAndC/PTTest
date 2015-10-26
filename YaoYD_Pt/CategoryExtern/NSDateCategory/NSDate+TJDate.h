//
//  NSDate+TJDate.h
//  YoYD_Pt
//
//  Created by Tianjian on 15/10/26.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TJDate)

+ (NSString*)efCreateSevenDayFromToday:(NSInteger)afterDate;

/**
 *  2014-01-08T21:21:22.737+05:30 转成2014-01-08
 *
 *  @param dateString 2014-01-08T21:21:22.737+05:30 格式时间
 *
 *  @return 2014-01-08 格式时间
 */
+ (NSString*)efExchangeDateString:(NSString*)dateString;
/**
 *  将 2015-09-12 转成 周六
 *
 *  @param dateString 2015-09-12 日期格式
 *
 *  @return 周六
 */
+ (NSString*)efExchangeToWeekDayFromStringDate:(NSString*)dateString;
/**
 *  将 2015-09-12 转成 星期六
 *
 *  @param dateString 2015-09-12
 *
 *  @return 星期六
 */
+ (NSString*)efExchangeToWeekDayFromStringDate_:(NSString*)dateString;
/**
 *  将2015-09-12 转成 09/12
 *
 *  @param dateString 2015-09-12
 *
 *  @return 09/12
 */
+ (NSString*)efExchangeToFormatterFromStringDate:(NSString*)dateString;
/**
 *  将2015-09-12 转成 09月12日
 *
 *  @param dateString 2015-09-12
 *
 *  @return 09月12日
 */
+ (NSString*)efExchangeToFormatterFromStringDate_:(NSString *)dateString;

@end
