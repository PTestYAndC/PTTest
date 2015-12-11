//
//  TabBarView.h
//  YaoYDCoach2
//
//  Created by YM on 15/11/27.
//  Copyright © 2015年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBarView;
@protocol TabBarViewDelegate <NSObject>

- (void)tabbarView:(TabBarView *)tabbarView selectedIndex:(NSInteger)index;

@end

@interface TabBarView : UIView

@property (nonatomic,weak) UIViewController<TabBarViewDelegate> *delegate;

- (void)configTabbarWithImages:(NSArray *)imagesArray;

@end
