//
//  TabbarHelper.m
//  YaoYDCoach2
//
//  Created by YM on 15/11/27.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "TabbarHelper.h"

#import "MineVC.h"
#import "CourseVC.h"
#import "CoursePlanVC.h"
#import "APPMacro.h"
@implementation TabbarHelper

+(NSArray<UIViewController *> *)defautlControllers{
    MineVC *mineVC              = [[MineVC alloc] init];
    CourseVC *courseVC          = [[CourseVC alloc] init];
    CoursePlanVC *coursePlanVC  = [[CoursePlanVC alloc] init];
    NSArray *vcArray = @[courseVC,coursePlanVC,mineVC];
    return vcArray;
}

+ (NSArray<NSDictionary *> *)tabbarNormalAndSelectedImages{
    NSDictionary *mineImages        = @{@"normal"   :LOADIMAGE(@"tab01@2x", @"png"),
                                        @"selected" :LOADIMAGE(@"tab01_P@2x", @"png")};
    
    NSDictionary *courseImages      = @{@"normal"   :LOADIMAGE(@"tab02@2x", @"png"),
                                        @"selected" :LOADIMAGE(@"tab02_P@2x", @"png")};
    
    NSDictionary *coursePlanImages  = @{@"normal"   :LOADIMAGE(@"tab03@2x", @"png"),
                                        @"selected" :LOADIMAGE(@"tab03_P@2x", @"png")};
    
    NSArray *imageArray = @[courseImages,coursePlanImages,mineImages];
    return imageArray;
}

@end
