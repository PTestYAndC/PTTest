//
//  CourseApi.m
//  YaoYDCoach2
//
//  Created by YM on 15/12/4.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "CourseApi.h"

@implementation CourseApi

+ (void)featchCitiesWithsuccess:(SuccessCallBack)success failure:(FailCallBack)failure{
    
    [BaseRequestManager GetRequsetWithUrl:kApiCities withParms:nil success:^(id responseData) {
        success(responseData);
    } failure:^(ErrorResposeModel *errorModel) {
        failure(errorModel);
    }];
}

@end
