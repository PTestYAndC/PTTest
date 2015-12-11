//
//  BaseApi.h
//  YaoYDCoach2
//
//  Created by YM on 15/12/2.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "BaseObject.h"

#import "BaseRequestManager.h"


typedef void(^SuccessCallBack)(id responseData);
typedef void(^FailCallBack)(ErrorResposeModel *errModel);

@interface BaseApi : BaseObject

@end
