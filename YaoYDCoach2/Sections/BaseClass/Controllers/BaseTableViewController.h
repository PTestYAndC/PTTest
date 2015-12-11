//
//  BaseTableViewController.h
//  YaoYDCoach2
//
//  Created by YM on 15/12/2.
//  Copyright © 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavBarView.h"
#import "APPMacro.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

@interface BaseTableViewController : UITableViewController

@property (nonatomic,assign) BOOL cancelRequsetWhenBack;

@property (nonatomic,strong) NavBarView *navBarView;


- (void)showTips:(NSString *)msg;
- (void)showFastFadeTips:(NSString *)msg withDelay:(int)delay;
- (void)hideTipsAfterDelay:(int)second;
- (void)hideTips;
- (void)hideTipsAfterDelay;

//没有网络的配置
- (void)noNetWorkConfig;

//取消掉所有的网络请求
- (void)cancelAllRequest;

//右键点击效果
- (void)rightItemClick:(id)sender;


@end
