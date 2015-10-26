//
//  BaseTableViewController.h
//  YaoYD
//
//  Created by 陈胜华 on 15/9/10.
//  Copyright (c) 2015年 oneyd.me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppMacro.h"
#import "TJMockNavigationBar.h"
#import <MJExtension.h>
#import "UIScrollView+EmptyDataSet.h"
#import "UIImageView+WebCache.h"
//#import "TalkingData.h"
//#import "TJToastView.h"

#ifdef NSFoundationVersionNumber_iOS_7_1
#define TJ_IS_IOS8_OR_GREATER (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1)
#else
#define TJ_IS_IOS8_OR_GREATER NO
#endif

typedef void (^CurrentLoaction)(NSString* loactionLat,NSString*locationLng);

@interface BaseTableViewController : UITableViewController

@property (nonatomic,copy) CurrentLoaction currentLactionBlock;

@property (nonatomic, weak) IBOutlet TJMockNavigationBar *mockNavigationBar;

@property (copy,  nonatomic) NSString *talkingPageName;

- (void)startUpdateLoaction;
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
