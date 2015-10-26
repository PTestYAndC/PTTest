//
//  BaseViewController.h
//  YaoYD
//
//  Created by 陈胜华 on 15/7/9.
//  Copyright (c) 2015年 oneyd.me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppMacro.h"
#import "UIButton+TJButtom.h"
#import "TJMockNavigationBar.h"
#import "UIColor+TJColor.h"
#import <MJExtension.h>
#import "UIScrollView+EmptyDataSet.h"
#import "UIImageView+WebCache.h"
//#import "TalkingData.h"
//#import "TJToastView.h"

typedef void (^CurrentLoaction)(NSString* loactionLat,NSString*locationLng);

@interface BaseViewController : UIViewController

- (void)startUpdateLoaction;

@property (nonatomic,copy) CurrentLoaction currentLactionBlock;

/** 自定义导航栏视图 */
@property (nonatomic,strong) UIView *evNavBarCustomView;

@property (copy,  nonatomic) NSString *talkingPageName;

/** 设置自定义导航栏 */
- (void)efSetNavBar;

/** 设置导航栏文字 */
- (void)efSetNavBarTitle:(NSString*)title textColor:(UIColor*)color;
/** 设置导航栏 backItem */
- (void)efSetNavBackButton:(BOOL)isShowBackItem;
/** 设置点击返回方法 */
- (void)efSetNavBackOnClickAction:(UIButton*)buttom withEvent:(UIEvent*)event;

/**
 *  设置talkingPageName
 *
 *  @param name 控制器名称，如BaseViewController页
 */
- (void)efSetTalkingPageName:(NSString*)name;
/**
 *  设置普通点击事件
 *
 *  @param eventID 事件标签
 */
- (void)efSendTalkingEvent:(NSString*)eventID;
/**
 *  设置相同的点击事件，带子标签
 *
 *  @param eventID    事件标签
 *  @param eventLabel 事件子标签
 */
- (void)efSendTalkingEvent:(NSString*)eventID label:(NSString *)eventLabel;
/**
 *  初始化UIStoryboard类型的控制器
 *
 *  @param name 控制器名称
 *
 *  @return VC
 */
- (UIViewController*)efUIStoryboardCtrlWithName:(NSString*)name;


@end
