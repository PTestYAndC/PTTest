//
//  RequestFactroy.h
//  YaoYDCoach2
//
//  Created by YM on 15/12/9.
//  Copyright © 2015年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "APPMacro.h"

@interface RequestFactroy : NSObject


+ (instancetype)defaultFactroy;


+ (void)addOpertaion:(NSOperation *)op;



@end
