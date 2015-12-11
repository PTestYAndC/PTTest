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
