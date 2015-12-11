//
//  BaseRequestConfig.m
//
//  Created by YM on 15/10/25.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "BaseRequestConfig.h"



@implementation BaseRequestConfig

+ (NSDictionary *)defaultHttpHarders{

    NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
    [tempDic setValue:@"application/json" forKey:@"Content-Type"];
    
    return tempDic;

}

@end
