//
//  CourseService.m
//  YaoYDCoach2
//
//  Created by YM on 15/12/4.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "CourseService.h"

@implementation CourseService

+ (void)featchCitiesWithComplete:(void (^)(BOOL, id, NSString *))complete{

    [CourseApi featchCitiesWithsuccess:^(id responseData) {
        //处理数据
    } failure:^(ErrorResposeModel *errModel) {
        
    }];
}

@end
