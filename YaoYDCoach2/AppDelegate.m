//
//  AppDelegate.m
//  YaoYDCoach2
//
//  Created by YM on 15/11/27.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarVC.h"
#import "NavigationController.h"

#import <wax.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    

//    [self downloadLuaFile];
    
    self.window                     = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor     = [UIColor whiteColor];
    TabBarVC *vc                    = [[TabBarVC alloc] init];
    
    
    NavigationController *nav       = [[NavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.hidden        = YES;

    self.window.rootViewController  = nav;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)downloadLuaFile{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *fileName = @"change_002.lua";     //本地要保存的文件名称。
        NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *directory = [doc stringByAppendingPathComponent:fileName];
        
        NSURL *url=[NSURL URLWithString:@"http://localhost/init.lua"];        //lua文件的服务器地址

        NSURLRequest *request=[NSURLRequest requestWithURL:url];
        
        NSError *error=nil;
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
        
        if([data length]>0)
            
        {
            NSLog(@"下载成功");
            if([data writeToFile:directory atomically:YES]){
                NSLog(@"保存成功");
                NSString *luaFilePath = [[NSString alloc ] initWithFormat:@"%@/?.lua;%@/?/init.lua;%@/?.dat;",doc, doc,doc];
                setenv(LUA_PATH, [luaFilePath UTF8String], 1); //设置LUA路径
                wax_start("change_002.lua", nil);
            }else {
                NSLog(@"保存失败");
            }
        } else {
            NSLog(@"下载失败，失败原因：%@",error);
        }
    });
}

@end
