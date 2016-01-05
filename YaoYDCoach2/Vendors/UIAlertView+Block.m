//
//  UIAlertView+Block.m
//  YaoYDCoach2
//
//  Created by YM on 16/1/5.
//  Copyright © 2016年 YM. All rights reserved.
//
#import <objc/runtime.h>
#import "UIAlertView+Block.h"


static const char *BlockDelegateKey = "!BlockDelegateKey!";

@interface BlockUIAlertViewDelegate : NSObject<UIAlertViewDelegate>
{
    void(^_block)();
}

- (instancetype)initWithBlock:(void(^)())block;

@end

@implementation BlockUIAlertViewDelegate

- (instancetype)initWithBlock:(void (^)())block{
    self = [super init];
    if (self) {
        //设置关联对象，值为self
        objc_setAssociatedObject(self, BlockDelegateKey, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        _block = block;
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    BLOCK_EXEC(_block,alertView,buttonIndex);
}

@end

@implementation UIAlertView (Block)

- (void)block_clickedButtonAtIndexWithBlock:(void (^)(UIAlertView *, NSInteger))block{
    id delegate = objc_getAssociatedObject([[BlockUIAlertViewDelegate alloc] initWithBlock:block], BlockDelegateKey);
    self.delegate = delegate;
}

@end
