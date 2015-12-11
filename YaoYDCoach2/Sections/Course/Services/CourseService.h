//
//  CourseService.h
//  YaoYDCoach2
//
//  Created by YM on 15/12/4.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "BaseService.h"
#import "CourseApi.h"
@interface CourseService : BaseService

+ (void)featchCitiesWithComplete:(void (^)(BOOL isSuccess,id model,NSString *errMsg))complete;

@end
