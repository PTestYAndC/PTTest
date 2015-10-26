//
//  AppDelegate.h
//  YaoYD_Pt
//
//  Created by Tianjian on 15/10/26.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HomeVC.h"
#import "TeacherVC.h"
#import "StudentVC.h"
#import "MineVC.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) HomeVC    *homeVC;
@property (strong, nonatomic) StudentVC *studentVC;
@property (strong, nonatomic) TeacherVC *teacherVC;
@property (strong, nonatomic) MineVC    *mineVC;
@property (strong, nonatomic) UITabBarController *tabBarVC;


@end

