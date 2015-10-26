//
//  LoginVC.m
//  PT
//
//  Created by YM on 15/10/25.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "LoginVC.h"
#import "LoginHelper.h"
@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareDate];
}

- (void)prepareDate{
    [LoginHelper loginWithParms:@{@"":@""}
                      completed:^(User *user, NSString *errorMsg) {
                          if (errorMsg) {
                              [self showFadeMSg:errorMsg];
                          }else{
                              [self doSomething];
                          }
    }];
    
    [LoginHelper loginWithParms:nil completed:nil];
}



- (void)showFadeMSg:(NSString *)errMsg{
    
}

- (void)doSomething{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
