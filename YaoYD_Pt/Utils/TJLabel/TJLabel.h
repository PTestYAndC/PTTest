//
//  TJLabel.h
//  YaoYDCoach_Person
//
//  Created by 陈胜华 on 15/7/9.
//  Copyright (c) 2015年 oneyd.me. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * UILabel设置居上对齐，居中对齐，居下对齐
 */

typedef NS_ENUM(NSInteger, NSTextVerticalAlignment) {
    NSTextVerticalAlignmentTop = 0,
    NSTextVerticalAlignmentMiddle,
    NSTextVerticalAlignmentBottom
};

@interface TJLabel : UILabel{
    @private
    NSTextVerticalAlignment _verticalAlignment;
}

@property (nonatomic) NSTextVerticalAlignment verticalAlignment;

@end
