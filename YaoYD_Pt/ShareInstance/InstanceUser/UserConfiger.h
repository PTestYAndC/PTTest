//
//  UserConfiger.h
//  PT
//
//  Created by YM on 15/10/25.
//  Copyright © 2015年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserConfiger : NSObject

+ (instancetype)shareConfiger;

@property (nonatomic,copy) User *currentUser;

@end
