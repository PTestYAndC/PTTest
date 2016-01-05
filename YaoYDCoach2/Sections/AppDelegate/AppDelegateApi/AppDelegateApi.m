//
//  AppDelegateApi.m
//  YaoYDCoach2
//
//  Created by YM on 16/1/4.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "AppDelegateApi.h"

@implementation AppDelegateApi

+ (void)featchErrorInfo:(SuccessCallBack)success failure:(FailCallBack)failure{
    
    [BaseRequestManager GetRequsetWithUrl:kApiCities withParms:nil success:^(id responseData) {
        success(responseData);
    } failure:^(ErrorResposeModel *errorModel) {
        failure(errorModel);
    }];
}

@end
