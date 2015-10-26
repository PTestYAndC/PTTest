//
//  NSURL+TJUrl.h
//  YoYD_Pt
//
//  Created by Tianjian on 15/10/26.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (TJUrl)

/**
 *  将URL 转成 string
 *
 *  @param url url
 *
 *  @return string
 */
+ (NSString*)stringFromUrl:(NSURL*)url;
/**
 *  将字符串转换成  URL
 *
 *  @param string https://...
 *
 *  @return URL
 */
+ (NSURL*) urlFromString:(NSString*)string;
/**
 *  替换字符串
 *
 *  @param charStr    如：*  号
 *  @param indexStart 开始位置
 *  @param indexEnd   结束位置
 *
 *  @return
 */
+ (NSString*)string:(NSString*)nomarlStr
        replaceWith:(NSString*)charStr
          FromIndex:(NSInteger)indexStart
            ToIndex:(NSInteger)indexEnd;
@end
