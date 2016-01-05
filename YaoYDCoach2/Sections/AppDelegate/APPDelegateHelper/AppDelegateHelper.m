//
//  AppDelegateHelper.m
//  YaoYDCoach2
//
//  Created by YM on 16/1/4.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "AppDelegateHelper.h"

@implementation AppDelegateHelper

/**
 *  下载补丁文件
 */
+ (void)downLoadLuaFile{}


/**
 *  请求lua信息，有需要下载的lua文件就进行下载。
 */
+ (void)requestForLuaFileInfo{}

/**
 *  加载lua信息
 */
+ (void)loadLuaFile{}

#pragma mark - bug级别相关

/**
 *  请求当前版本错误信息
 */
+ (void)requestForErrorInfo{}

/**
 * 一般级别显示弹窗提示
 */
+ (void)showAlterView{}

/**
 *  严重级别显示网页。
 */
+ (void)showWebView{}

#pragma mark -数据相关

/**
 *  清除老数据
 */
+ (void)clearOldData{}


@end
