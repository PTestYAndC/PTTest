//
//  NavBarView.m
//  YaoYDCoach2
//
//  Created by YM on 15/11/27.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "NavBarView.h"
#import <Masonry.h>

@interface NavBarView ()
{
    UIButton *leftButton;
    UIButton *rightButton;
}
@end

@implementation NavBarView

#pragma mark - init
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialization];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization {
    [self setupViews];
    [self layout];
}

- (void)setupViews{
    self.backgroundColor = [UIColor clearColor];
    _navBackgroundView = [UIView new];
    _navBackgroundView.backgroundColor = [UIColor orangeColor];
    [self addSubview:_navBackgroundView];
    
    _leftItemView = [UILabel new];
    [self addSubview:_leftItemView];
    
    _rightItemView = [UILabel new];
    [self addSubview:_rightItemView];
    
    _titleView = [UILabel new];
    
    ((UILabel *)_titleView).font = [UIFont boldSystemFontOfSize:24];
    ((UILabel *)_titleView).textColor = [UIColor whiteColor];
    ((UILabel *)_titleView).shadowColor = [UIColor redColor];
    ((UILabel *)_titleView).shadowOffset = CGSizeMake(1.0,1.0);
    ((UILabel *)_titleView).lineBreakMode = NSLineBreakByWordWrapping;//截去中间
    ((UILabel *)_titleView).textAlignment = NSTextAlignmentCenter;
    [_navBackgroundView addSubview:_titleView];
    
    rightButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [rightButton addTarget:self action:@selector(rightClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:rightButton];
    
    leftButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [leftButton addTarget:self action:@selector(leftClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:leftButton];
}

- (void)layout{
    __weak typeof(self) weakSelf = self;
    [self.navBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.left.bottom.and.right.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@150);
        make.centerX.equalTo(self);
        make.centerY.equalTo(weakSelf).offset(10);
    }];
    
    [self.leftItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@40);
        make.height.equalTo(@30);
        make.leading.equalTo(weakSelf);
        make.centerY.equalTo(weakSelf).offset(10);
    }];
    
    [self.rightItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@90);
        make.height.equalTo(@40);
        make.trailing.equalTo(weakSelf).offset(-10);
        make.centerY.equalTo(weakSelf).offset(10);
    }];
    
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.and.right.equalTo(weakSelf.rightItemView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.and.right.equalTo(weakSelf.leftItemView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#pragma mark -SET

- (void)setRightTitle:(NSString *)rightTitle{
    _rightTitle = rightTitle;
    if ([_rightItemView isKindOfClass:[UILabel class]]) {
        ((UILabel *)_rightItemView).text = _rightTitle;
    }
}

- (void)setTitle:(NSString *)title{
    _title = title;
    if ([_titleView isKindOfClass:[UILabel class]]) {
        ((UILabel *)_titleView).text = _title;
    }
}

- (void)setLeftTitle:(NSString *)leftTitle{
    _leftTitle = leftTitle;
    if ([_leftItemView isKindOfClass:[UILabel class]]) {
        ((UILabel *)_leftItemView).text = _leftTitle;
    }
}

#pragma mark - Actions
- (void)leftClicked:(id)sender{
    if (self.delegate) {
        [self.delegate navBarView:self leftClicked:_leftItemView];
    }
}

- (void)rightClicked:(id)sender{
    if (self.delegate) {
        [self.delegate navBarView:self rightClicked:_rightItemView];
    }
}

@end
