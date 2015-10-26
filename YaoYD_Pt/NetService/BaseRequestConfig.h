//
//  BaseRequestConfig.h
//
//  Created by YM on 15/10/25.
//  Copyright © 2015年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  请求基类配置
 */

#define kErrorNetMsgDic (@{@"errmsg":@"网络连接异常"})
#define BaseUrl                 @""
#define kImageServicerName      @"file"             //服务端约定的图片名称
#define kImageServicerFileName  @"photo.jpg"        //服务端约定的文件名称
#define BOUNDARY                @"boundary"         //服务端接受参数分割线
#define kRequestTimeout         1                   //设置超时时间

@interface BaseRequestConfig : NSObject

+ (NSDictionary *)defaultHttpHarders;

@end
