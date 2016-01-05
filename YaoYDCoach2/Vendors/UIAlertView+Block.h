//
//  UIAlertView+Block.h
//  YaoYDCoach2
//
//  Created by YM on 16/1/5.
//  Copyright © 2016年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APPMacro.h"
@interface UIAlertView (Block)

- (void)block_clickedButtonAtIndexWithBlock:(void (^)(UIAlertView *alert,NSInteger index))block;

@end
