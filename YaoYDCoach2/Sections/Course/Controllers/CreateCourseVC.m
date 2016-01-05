//
//  CreateCourseVC.m
//  YaoYDCoach2
//
//  Created by YM on 15/11/27.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "CreateCourseVC.h"
#import "BaseRequestManager.h"
#import "RequestManager.h"

#import "UIAlertView+Block.h"
@interface CreateCourseVC ()<UIAlertViewDelegate>

@end

@implementation CreateCourseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];

    self.navBarView.rightTitle = @"sdsds";
    
    self.navBarView.leftTitle = @"<<";
    self.cancelRequsetWhenBack = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)viewDidAppear:(BOOL)animated{
//    [self requsetForXX];
    [super viewDidAppear:animated];
}

- (void)requsetForXX{
//    NSDictionary *dic = @{};
//    NSDictionary *fields = @{@"Authorization":@"Basic MzUzYjMwMmM0NDU3NGY1NjUwNDU2ODdlNTM0ZTdkNmE6Mjg2OTI0Njk3ZTYxNWE2NzJhNjQ2YTQ5MzU0NTY0NmM=",
//                             };

    NSString *urlString = [NSString stringWithFormat:@"%@%@",@"https://tenant-api-test.1yd.me",@"/api/open/cities"];
    for (int i = 0; i < 20; i++) {
        
    [[RequestManager shareManager] GetRequsetWithUrl:urlString withParms:nil success:^(id  _Nullable tokenParams) {
//        NSLog(@"token-->%@",tokenParams);
    } failure:^(ErrorResposeModel * _Nullable errorModel) {
        NSLog(@"errorModel -->%@",errorModel.errmsg);
    }];
       
    }
}

- (void)rightItemClick:(id)sender{
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIAlertView *alView = [[UIAlertView alloc] initWithTitle:@"sda" message:@"adaa" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
    [alView block_clickedButtonAtIndexWithBlock:^(UIAlertView *alert, NSInteger index) {
        NSLog(@"adaasdaad");
    }];
    [alView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"ada");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
