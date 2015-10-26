//
//  ErrorResposeModel.m
//  PT
//
//  Created by YM on 15/10/25.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "ErrorResposeModel.h"

@implementation ErrorResposeModel


- (NSString *)errText{
    
    NSString *tempString = _errmsg;
    if([self IsChinese:tempString]) {
        return tempString;
    }else if([tempString isEqualToString:@""]) {
        return @"";
    }else{
        return @"网络异常";
    }
}


//判断是否有中文
- (BOOL)IsChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}

@end
