//
//  UserConfiger.m
//  PT
//
//  Created by YM on 15/10/25.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "UserConfiger.h"

@implementation UserConfiger

+ (instancetype)shareConfiger{
    static UserConfiger *config;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[UserConfiger alloc] init];
    });
    return config;
}




@end
