//
//  CourseApi.h
//  YaoYDCoach2
//
//  Created by YM on 15/12/4.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "BaseApi.h"

#import "BaseRequestManager.h"

@interface CourseApi : BaseApi

+ (void)featchCitiesWithsuccess:(SuccessCallBack) success failure:(FailCallBack)failure;

@end
