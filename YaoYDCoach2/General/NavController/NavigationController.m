//
//  NavigationController.m
//  YaoYDCoach2
//
//  Created by YM on 15/11/27.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "NavigationController.h"
@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.swiper = [[SloppySwiper alloc] initWithNavigationController:self];
    self.delegate = self.swiper;
}



@end
