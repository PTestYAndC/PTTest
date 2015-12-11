//
//  RequestFactroy.m
//  YaoYDCoach2
//
//  Created by YM on 15/12/9.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "RequestFactroy.h"
#import <AFNetworking.h>
@interface RequestFactroy ()

@property (nonatomic,strong) NSOperationQueue *apiQueue;

@end

@implementation RequestFactroy
+ (instancetype)defaultFactroy{
    static dispatch_once_t onceToken;
    static RequestFactroy *factroy;
    dispatch_once(&onceToken, ^{
        factroy = [[RequestFactroy alloc] init];
        factroy.apiQueue = [[NSOperationQueue alloc] init];
        factroy.apiQueue.maxConcurrentOperationCount = 3;
        
        
        [[NSNotificationCenter defaultCenter] addObserver:factroy selector:@selector(cancelRequsetInVC:) name:kNotificationCancelRequsetsInVC object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:factroy selector:@selector(cancelAllRequset) name:kNotificationCancelAllRequsets object:nil];

    });
    return factroy;
}

+ (void)addOpertaion:(NSOperation *)op{
    op.name = [[NSUserDefaults standardUserDefaults] objectForKey:CurrentVC];
    [[RequestFactroy defaultFactroy].apiQueue addOperation:op];
}


//取消所在VC的所有请求
- (void)cancelRequsetInVC:(NSNotification *)notification{

    NSString *classString = notification.object ;
    NSArray *opArray = [_apiQueue operations];
    for (NSOperation *op in opArray) {
        if ([op.name isEqualToString:classString]) {
            [op cancel];
        }
    }
}

//取消所有请求
- (void)cancelAllRequset{
    [_apiQueue cancelAllOperations];
}

@end
