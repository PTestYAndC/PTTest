//
//  AppDelegateApi.h
//  YaoYDCoach2
//
//  Created by YM on 16/1/4.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "BaseApi.h"

@interface AppDelegateApi : BaseApi

+ (void)featchErrorInfo:(SuccessCallBack)success failure:(FailCallBack)failure;

@end
