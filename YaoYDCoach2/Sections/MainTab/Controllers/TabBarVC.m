//
//  TabBarVC.m
//  YaoYDCoach2
//
//  Created by YM on 15/11/27.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "TabBarVC.h"

#import "TabBarView.h"

#import "TabbarHelper.h"

@interface TabBarVC ()<TabBarViewDelegate>
{
    TabBarView *_barView;

}
@end

@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self prepareControllers];

    
    //保留两位小数，四舍五入
    CGFloat rounded_up = round(0.355 * 100) / 100;
    NSLog(@"%.2lf",rounded_up);
    
    //保留两位小数，直接进1(天花板函数)
    CGFloat rounded_up1 = ceilf(0.355 * 100) / 100;
    NSLog(@"%.2lf",rounded_up1);
      
    //保留两位小数，舍弃后面所有位数。(地板函数)
    CGFloat rounded_up2 = floor(0.355 * 100) / 100;
    NSLog(@"%.2lf",rounded_up2);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -初始化

- (void)configUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBar.hidden  = YES;
    _barView             = [[TabBarView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight([UIScreen mainScreen].bounds) - 49, [UIScreen mainScreen].bounds.size.width, 49)];
    _barView.backgroundColor = [UIColor blackColor];
    [_barView configTabbarWithImages:[TabbarHelper tabbarNormalAndSelectedImages]];
    _barView.delegate = self;
    [self.view      addSubview:_barView];
    [self.tabBar    removeFromSuperview];

}

- (void)prepareControllers{
    self.viewControllers = [TabbarHelper defautlControllers];
}

#pragma mark -tabbarViewDelegate

- (void)tabbarView:(TabBarView *)tabbarView selectedIndex:(NSInteger)index{
    self.selectedIndex = index;
}


@end
