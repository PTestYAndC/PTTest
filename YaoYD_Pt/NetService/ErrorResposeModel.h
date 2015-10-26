//
//  ErrorResposeModel.h
//  PT
//
//  Created by YM on 15/10/25.
//  Copyright © 2015年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ErrorResposeModel : NSObject

@property (nonatomic,assign) int errorCode;
@property (nonatomic,copy)   NSString *errmsg;


/**
 *  根据errmsg转化为用户能看懂的文字
 *
 *  @return 中文错误提示
 */
- (NSString *)errText;

@end
