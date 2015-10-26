//
//  BaseViewController.m
//  YaoYD
//
//  Created by 陈胜华 on 15/7/9.
//  Copyright (c) 2015年 oneyd.me. All rights reserved.
//

#import "BaseViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface BaseViewController()<CLLocationManagerDelegate>{
    CLLocationManager *locationManager;
}


@property (strong,nonatomic) UILabel  *evlblNavBar;

@end

@implementation BaseViewController

- (void)viewWillAppear:(BOOL)animated{
    /*
    if (![self.talkingPageName isEqualToString:@""]) {
        [TalkingData trackPageBegin:self.talkingPageName];
    } else{
        [TalkingData trackPageBegin:@"BaseViewControler"];
    }*/
}
- (void)viewDidDisappear:(BOOL)animated{
    /*
    if (![self.talkingPageName isEqualToString:@""]) {
        [TalkingData trackPageEnd:self.talkingPageName];
    } else{
        [TalkingData trackPageEnd:@"BaseViewControler"];
    }*/
}
- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self efSetNavBar];
    [self efSetNavBackButton:YES];
    [self _efSetTalkingLogEnabled];
}

- (void)_efSetTalkingLogEnabled{
    /*
    if (TalkingDataLog) {
        [TalkingData setLogEnabled:YES];
    } else {
        [TalkingData setLogEnabled:NO];
    }*/
}
/** 设置talkingPageName */
- (void)efSetTalkingPageName:(NSString*)name{
    self.talkingPageName = name;
}
- (void)efSendTalkingEvent:(NSString*)eventID{
//    [TalkingData trackEvent:eventID];
}
- (void)efSendTalkingEvent:(NSString*)eventID label:(NSString *)eventLabel{
//    [TalkingData trackEvent:eventID label:eventLabel];
}
- (void)efSendTalkingEvent:(NSString*)eventID label:(NSString *)eventLabel parm:(NSDictionary *)parm{
//    [TalkingData trackEvent:eventLabel label:eventLabel parameters:parm];
}
- (void)efSetNavBar{
    self.evNavBarCustomView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
}
#pragma mark -------------------设置导航栏 标题 --------------------------------
- (void)efSetNavBarTitle:(NSString*)title textColor:(UIColor*)color{
    if (self.evlblNavBar == nil) {
        self.evlblNavBar = [[UILabel alloc]init];
        self.evlblNavBar.frame = CGRectMake(35, 64-3-40, [UIScreen mainScreen].bounds.size.width-70, 40);
        self.evlblNavBar.font = [UIFont systemFontOfSize:18];
        self.evlblNavBar.textAlignment = NSTextAlignmentCenter;
        [[self evNavBarCustomView]addSubview:self.evlblNavBar];
    }
    self.evlblNavBar.backgroundColor = [UIColor clearColor];
    self.evlblNavBar.text = title;
    if (color != nil) {
        self.evlblNavBar.textColor = color;
    } else {
        self.evlblNavBar.textColor = [UIColor whiteColor];
    }

    //[etlblNavBar mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.left.and.right.equalTo(self.evNavBarCustomView).offset(0);
        //make.bottom.equalTo(self.evNavBarCustomView).offset(-3);
        //make.height.offset(40);
    //}];
}

#pragma mark -------------------NavBackButtom-------------------
- (void)efSetNavBackButton:(BOOL)isShowBackItem{
    UIButton *etbtnNavBarBack = [UIButton buttonWithType:UIButtonTypeSystem];
    if (isShowBackItem) {
//        [etbtnNavBarBack setTitle:[TJIconFont codeForName:Icon_NavBarBack] forState:UIControlStateNormal];
//        etbtnNavBarBack.titleLabel.font = [UIFont fontWithName:Icon_Font size:22];
        etbtnNavBarBack.frame = CGRectMake(10, 64-10-25, 25, 25);
        etbtnNavBarBack.titleLabel.textColor = [UIColor greenColor];
        [etbtnNavBarBack setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [etbtnNavBarBack setEnlargeEdgeWithTop:15 right:15 bottom:15 left:15];
        [etbtnNavBarBack addTarget:self
                            action:@selector(efSetNavBackOnClickAction:withEvent:) forControlEvents:UIControlEventTouchUpInside];
        [[self evNavBarCustomView] addSubview:etbtnNavBarBack];
    } else{
        
    }
}
- (void)efSetNavBackOnClickAction:(UIButton*)buttom withEvent:(UIEvent*)event{
    
}
- (UIView *)evNavBarCustomView{
    if (_evNavBarCustomView == nil) {
        _evNavBarCustomView = [[UIView alloc]init];
        _evNavBarCustomView.backgroundColor = HEX_RGB(0xff5400);
        [self.view addSubview:_evNavBarCustomView];
    }
    return _evNavBarCustomView;
}

- (UIViewController*)efUIStoryboardCtrlWithName:(NSString*)name{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    UIViewController *vc = [storyboard instantiateInitialViewController];
    return vc;
}

/*
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}*/

#pragma mark CLLocationManagerDelegate
- (void)startUpdateLoaction{
    if (locationManager == nil) {
        locationManager = [[CLLocationManager alloc] init];
    }
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSString *strLat = [NSString stringWithFormat:@"%.6f",newLocation.coordinate.latitude];
    NSString *strLng = [NSString stringWithFormat:@"%.6f",newLocation.coordinate.longitude];
    self.currentLactionBlock(strLat,strLng);
    [locationManager stopUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"locError:%@", error);
}

@end
