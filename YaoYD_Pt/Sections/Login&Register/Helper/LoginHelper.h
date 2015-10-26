//
//  LoginHelper.h
//  PT
//
//  Created by YM on 15/10/25.
//  Copyright © 2015年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

typedef void(^LoginResponse)( User * _Nullable user, NSString * _Nullable errorMsg);

@interface LoginHelper : NSObject

+ (void)loginWithParms:(NSDictionary *_Nonnull)dic completed:(_Nonnull LoginResponse)res;

#pragma mark -转化
+ (NSDictionary *_Nullable)carveUpUserName:(NSString *_Nonnull)uerName;

@end
