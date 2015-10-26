//
//  NSDate+TJDate.m
//  YoYD_Pt
//
//  Created by Tianjian on 15/10/26.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "NSDate+TJDate.h"

@implementation NSDate (TJDate)

+ (NSString*)efCreateSevenDayFromToday:(NSInteger)afterDate;{
    NSTimeInterval a_day = 24*60*60*afterDate;
    NSDate *date = [NSDate date];
    NSDate *tomorrow = [date dateByAddingTimeInterval:a_day];//[date addTimeInterval:a_day];
    NSDateFormatter *formmater = [[NSDateFormatter alloc]init];
    [formmater setDateFormat:@"yyyy'-'MM'-'dd"];
    return [formmater stringFromDate:tomorrow];
}
/**
 2014-01-08T21:21:22.737+05:30 转成2014-01-08
 */
+ (NSString*)efExchangeDateString:(NSString*)dateString{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ"];
    NSDate *currentDate = [dateFormatter dateFromString:dateString];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    return [dateFormatter stringFromDate:currentDate];
}

/**
 将 2015-09-12 转成 周六
 */
+ (NSString*)efExchangeToWeekDayFromStringDate:(NSString*)dateString{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date=[formatter dateFromString:dateString];
    
    NSArray *weekdayAry = [NSArray arrayWithObjects:@"SUN", @"MON", @"TUE", @"WED", @"THU", @"FRI", @"SAT", nil];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:NSLocalizedString(@"eee", nil)];
    //[dateFormatter setDateFormat:NSLocalizedString(@"YYYY.MM.dd.eee", nil)];
    [dateFormatter setShortWeekdaySymbols:weekdayAry];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    
    NSString *strWeekDay = [dateFormatter stringFromDate:date];
    
    if ([strWeekDay isEqualToString:@"SUN"]) {
        return @"周日";
    } else if ([strWeekDay isEqualToString:@"MON"]){
        return @"周一";
    } else if ([strWeekDay isEqualToString:@"TUE"]){
        return @"周二";
    } else if ([strWeekDay isEqualToString:@"WED"]){
        return @"周三";
    } else if ([strWeekDay isEqualToString:@"THU"]){
        return @"周四";
    } else if ([strWeekDay isEqualToString:@"FRI"]){
        return @"周五";
    } else{
        return @"周六";
    }
}
/**
 将 2015-09-12 转成 星期六
 */
+ (NSString*)efExchangeToWeekDayFromStringDate_:(NSString*)dateString{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date=[formatter dateFromString:dateString];
    
    NSArray *weekdayAry = [NSArray arrayWithObjects:@"SUN", @"MON", @"TUE", @"WED", @"THU", @"FRI", @"SAT", nil];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:NSLocalizedString(@"eee", nil)];
    [dateFormatter setShortWeekdaySymbols:weekdayAry];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    
    NSString *strWeekDay = [dateFormatter stringFromDate:date];
    
    if ([strWeekDay isEqualToString:@"SUN"]) {
        return @"星期天";
    } else if ([strWeekDay isEqualToString:@"MON"]){
        return @"星期一";
    } else if ([strWeekDay isEqualToString:@"TUE"]){
        return @"星期二";
    } else if ([strWeekDay isEqualToString:@"WED"]){
        return @"星期三";
    } else if ([strWeekDay isEqualToString:@"THU"]){
        return @"星期四";
    } else if ([strWeekDay isEqualToString:@"FRI"]){
        return @"星期五";
    } else{
        return @"星期六";
    }
}
/**将2015-09-12 转成 09/12 */
+ (NSString*)efExchangeToFormatterFromStringDate:(NSString*)dateString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date=[formatter dateFromString:dateString];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}
/**将2015-09-12 转成 09月12日 */
+ (NSString*)efExchangeToFormatterFromStringDate_:(NSString *)dateString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date=[formatter dateFromString:dateString];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM月dd日"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
    
}

@end
