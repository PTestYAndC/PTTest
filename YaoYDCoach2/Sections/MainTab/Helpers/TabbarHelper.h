//
//  TabbarHelper.h
//  YaoYDCoach2
//
//  Created by YM on 15/11/27.
//  Copyright © 2015年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TabbarHelper : NSObject

/**
 *  获取tabbarController的controllers
 *
 *  @return tabbarController的controllers
 */
+ (NSArray<UIViewController *> *)defautlControllers;

/**
 *  获取tabbarController底部tabbar的图片配置
 *
 *  @return 含有选中图片和未选中图片的数组
 */
+ (NSArray<NSDictionary *> *)tabbarNormalAndSelectedImages;



@end
