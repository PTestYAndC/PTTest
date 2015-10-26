//
//  LoginHelper.m
//  PT
//
//  Created by YM on 15/10/25.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "LoginHelper.h"
#import "BaseRequestManager.h"
#import <MJExtension.h>
#define kLoginRequse @"/login"
#import "User.h"
#import "ErrorResposeModel.h"
#import "UserConfiger.h"
@implementation LoginHelper

+ (void)loginWithParms:(NSDictionary *)dic completed:(LoginResponse)res{
    
    [BaseRequestManager PostRequsetWithUrl:kLoginRequse withParms:dic success:^(id responseData) {
        User *user = [User objectWithKeyValues:dic];
        
        //登录成功将user保存
        [UserConfiger shareConfiger].currentUser = user;
        
        if (res) {
            res(user,nil);
        }
    } failure:^(id responseData) {
        if (res) {
            ErrorResposeModel *errModel = [ErrorResposeModel objectWithKeyValues:responseData];
            res(nil,[errModel errText]);
        }
    }];
}

+ (NSDictionary *)carveUpUserName:(NSString *)userName{
    NSArray *nameArray = [userName componentsSeparatedByString:@" "];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"name1" forKey:nameArray[0]];
    [dic setObject:@"name2" forKey:nameArray[1]];
    return dic;
}


@end
