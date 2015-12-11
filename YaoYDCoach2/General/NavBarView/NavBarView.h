//
//  NavBarView.h
//  YaoYDCoach2
//
//  Created by YM on 15/11/27.
//  Copyright © 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NavBarView;
@protocol NavBarViewDelegate <NSObject>

- (void)navBarView:(NavBarView *)navBarView leftClicked:(id)sender;

- (void)navBarView:(NavBarView *)navBarView rightClicked:(id)sender;

@end

IB_DESIGNABLE
@interface NavBarView : UIView

/** *  背景View*/
@property (nonatomic,strong) UIView *navBackgroundView;

/** *  左item视图*/
@property (nonatomic,strong) UIView *leftItemView;

/***  右item视图*/
@property (nonatomic,strong) UIView *rightItemView;

/***  标题View*/
@property (nonatomic,strong) UIView *titleView;


@property (nonatomic,strong) NSString *leftTitle;

@property (nonatomic,strong) NSString *rightTitle;

@property (nonatomic,strong) NSString *title;




@property (nonatomic,weak) id<NavBarViewDelegate> delegate;


@end
