//
//  NetConfigMacro.h
//  JJ
//
//  Created by YM on 15/11/12.
//  Copyright © 2015年 YM. All rights reserved.
//

/**
 *  网络请求参数的相关配置
 */
#ifndef NetConfigMacro_h
#define NetConfigMacro_h


#define kAppVersion     (@"2.0.0")

#define kErrorNetMsgDic (@{@"errmsg":@"网络连接异常"})
#define kImageServicerName      @"file"             //服务端约定的图片名称
#define kImageServicerFileName  @"photo.jpg"        //服务端约定的文件名称
#define BOUNDARY                @"boundary"         //服务端接受参数分割线
#define kRequestTimeout         10                   //设置超时时间


#endif /* NetConfigMacro_h */
