//
//  AppDelegate.m
//  YaoYD_Pt
//
//  Created by Tianjian on 15/10/26.
//  Copyright © 2015年 oneyd.me. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)_efInitViewControllers{
    UINavigationController *tabBarNav = [[UINavigationController alloc]initWithRootViewController:[self tabBarVC]];
    tabBarNav.navigationBarHidden = YES;
    self.window.rootViewController = tabBarNav;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    [self _efInitViewControllers];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

- (HomeVC *)homeVC{
    if (_homeVC == nil) {
        _homeVC = [[HomeVC alloc]init];
        _homeVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"推荐" image:[UIImage imageNamed:@"tab_Home@2x"] selectedImage:[UIImage imageNamed:@"tab_Home_P@2x"]];
    }
    return _homeVC;
}
- (StudentVC *)studentVC{
    if (_studentVC == nil) {
        _studentVC = [[StudentVC alloc]init];
        _studentVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"找学校" image:[UIImage imageNamed:@"tab_Student@2x"] selectedImage:[UIImage imageNamed:@"tab_Student_P@2x"]];
    }
    return _studentVC;
}
- (TeacherVC *)teacherVC{
    if (_teacherVC == nil) {
        _teacherVC = [[TeacherVC alloc]init];
        _teacherVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"找老师" image:[UIImage imageNamed:@"tab_Teacher@2x"] selectedImage:[UIImage imageNamed:@"tab_Teacher_P@2x"]];
    }
    return _teacherVC;
}

- (MineVC *)mineVC{
    if (_mineVC == nil) {
        _mineVC = [[MineVC alloc]init];
        _mineVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我" image:[UIImage imageNamed:@"tab_Mine@2x"] selectedImage:[UIImage imageNamed:@"tab_Mine_P@2x"]];
    }
    return _mineVC;
}
- (UITabBarController *)tabBarVC{
    if (_tabBarVC == nil) {
        _tabBarVC = [[UITabBarController alloc]init];
        _tabBarVC.tabBar.tintColor = HEX_RGB(0xff5400);
        _tabBarVC.hidesBottomBarWhenPushed = YES;
        [_tabBarVC setViewControllers:@[[self homeVC],[self studentVC],[self teacherVC],[self mineVC]]];
    }
    return _tabBarVC;
}

@end
