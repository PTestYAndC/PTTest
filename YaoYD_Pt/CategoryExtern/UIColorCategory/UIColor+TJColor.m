//
//  UIColor+TJColor.m
//  YaoYDCoach_Person
//
//  Created by 陈胜华 on 15/7/9.
//  Copyright (c) 2015年 oneyd.me. All rights reserved.
//

#import "UIColor+TJColor.h"

@implementation UIColor (TJColor)

+ (UIColor *)colorWithRGBHex:(UInt32)hex
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}

+ (UIColor *)bgColor_nav
{
    return RGBCOLOR(235, 235, 235);
}

+ (UIColor *)bgColor_view
{
    return HEX_RGB(0xeeeeee);
}

@end
