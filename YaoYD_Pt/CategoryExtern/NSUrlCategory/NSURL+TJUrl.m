//
//  NSURL+TJUrl.m
//  YoYD_Pt
//
//  Created by Tianjian on 15/10/26.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "NSURL+TJUrl.h"

@implementation NSURL (TJUrl)
+ (NSString*)stringFromUrl:(NSURL*)url;{
    return [url absoluteString];
}

+ (NSURL*) urlFromString:(NSString*)string;{
    return [NSURL URLWithString:string];
}
+ (NSString*)string:(NSString*)nomarlStr
        replaceWith:(NSString*)charStr
          FromIndex:(NSInteger)indexStart
            ToIndex:(NSInteger)indexEnd;{
    NSString *str_Header = [nomarlStr substringToIndex:indexStart];
    NSString *str_Middle = @"";
    NSString *str_End    = [nomarlStr substringFromIndex:indexEnd];
    
    for (int i = 0; i < indexEnd - indexStart; i++) {
        str_Middle = [NSString stringWithFormat:@"%@%@",str_Middle,charStr];
    }
    
    return [NSString stringWithFormat:@"%@%@%@",str_Header,str_Middle,str_End];
}
@end
