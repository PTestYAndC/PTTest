//
//  CourseVC.m
//  YaoYDCoach2
//
//  Created by YM on 15/11/27.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "CourseVC.h"
#import "CreateCourseVC.h"

#import "RequestManager.h"

@interface CourseVC ()

@end

@implementation CourseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navBarView.title = @"首页";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CreateCourseVC *vc = [[CreateCourseVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];


 
    
    
    
    
    
//     ；
    
    
    
    
    
}
@end
