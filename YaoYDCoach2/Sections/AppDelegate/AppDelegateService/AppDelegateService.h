//
//  AppDelegateService.h
//  YaoYDCoach2
//
//  Created by YM on 16/1/4.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "BaseService.h"
#import "AppDelegateApi.h"
@interface AppDelegateService : BaseService

+ (void)featchErrorInfo:(void(^)(BOOL isSuccess,,NSString *message))sd;

@end
