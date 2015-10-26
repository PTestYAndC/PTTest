
//
//  NSString+Categroies.m
//  YaoYD
//
//  Created by Tianjian on 15/9/30.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "NSString+Categroies.h"

@implementation NSString (Categroies)
/**
 *  有限宽度计算文本高度
 *
 *  @param font   字体
 *  @param height 宽度
 *
 *  @return 高度
 */

/*
- (CGFloat)heightWithFont:(UIFont*)font forWidth:(CGFloat)width;{
    
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        
        return [self boundingRectWithSize:CGSizeMake(width, NSIntegerMax)
                                  options:NSStringDrawingTruncatesLastVisibleLine|
                NSStringDrawingUsesLineFragmentOrigin|
                NSStringDrawingUsesFontLeading
                               attributes:@{NSFontAttributeName:font}
                                  context:nil].size.height;
    }
    return [self sizeWithFont:font constrainedToSize:CGSizeMake(width, NSIntegerMax)].height;
}*/

/**
 *  有限高度计算文本宽度
 *
 *  @param font   字体
 *  @param height 高度
 *
 *  @return 宽度
 */
/*
- (CGFloat)widthWithFont:(UIFont*)font forHeight:(CGFloat)height;{
    
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        
        return [self boundingRectWithSize:CGSizeMake(NSIntegerMax, height)
                                  options:NSStringDrawingTruncatesLastVisibleLine|
                NSStringDrawingUsesLineFragmentOrigin|
                NSStringDrawingUsesFontLeading
                               attributes:@{NSFontAttributeName:font}
                                  context:nil].size.width;
    }
    return [self sizeWithFont:font constrainedToSize:CGSizeMake(NSIntegerMax, height)].width;
}*/

@end
