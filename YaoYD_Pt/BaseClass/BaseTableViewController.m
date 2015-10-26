
//
//  BaseTableViewController.m
//  YaoYD
//
//  Created by 陈胜华 on 15/9/10.
//  Copyright (c) 2015年 oneyd.me. All rights reserved.
//

#import "BaseTableViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <Masonry.h>

@interface BaseTableViewController ()<TJMockNavigationBarDelegate,CLLocationManagerDelegate>{
    CLLocationManager *locationManager;
}

@end

@implementation BaseTableViewController

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
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (TJ_IS_IOS8_OR_GREATER) {
        [self.tableView bringSubviewToFront:self.mockNavigationBar];
        [self.mockNavigationBar setFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 64)];
    }
    
    [self _efSetTalkingLogEnabled];
}

- (void)_efSetTalkingLogEnabled{
    if (TalkingDataLog) {
//        [TalkingData setLogEnabled:YES];
    } else {
//        [TalkingData setLogEnabled:NO];
    }
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

- (UIViewController*)efUIStoryboardCtrlWithName:(NSString*)name{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    UIViewController *vc = [storyboard instantiateInitialViewController];
    return vc;
}

#pragma mark - ScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (TJ_IS_IOS8_OR_GREATER) {
        [self.tableView bringSubviewToFront:self.mockNavigationBar];
        float topOffset = scrollView.contentOffset.y;
        [self.mockNavigationBar mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@(topOffset));
        }];
    }
}

#pragma mark - TJMockNavigationBarDelegate
-(void)leftButtonClicked {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightButtonClicked {
    
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //备注：需要测色ios7
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    // Explictly set your cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
