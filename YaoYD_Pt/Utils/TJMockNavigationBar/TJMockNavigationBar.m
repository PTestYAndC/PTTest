//
//  TJMockNavigationBar.m
//  YaoYDCoach
//
//  Created by holin on 7/20/15.
//  Copyright (c) 2015 1YD.ME. All rights reserved.
//

#import "TJMockNavigationBar.h"
#import <Masonry.h>
#import "UIColor+TJColor.h"
#import "UIButton+TJButtom.h"

@interface TJMockNavigationBar()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@end

@implementation TJMockNavigationBar


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
    self.backgroundColor = HEX_RGB(0xff5400);
    
    _title = @"默认标题";
    
    [self setupViews];
    
    [self layout];
}

#pragma mark - Views
- (void)setupViews {
    _titleLabel = [UILabel new];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.text = _title;
    _titleLabel.font = [UIFont systemFontOfSize:18];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:_titleLabel];
    
    _leftButton = [UIButton new];
    
    NSDictionary *fontAttr = [NSDictionary
                              dictionaryWithObjectsAndKeys:
                              [UIColor whiteColor],
                              NSForegroundColorAttributeName,
                              [UIFont fontWithName:@"iconfont" size:22.0],
                              NSFontAttributeName, nil];
    
    //备注：
    NSAttributedString *attrTitle = [[NSAttributedString alloc] initWithString:@"\ue61f"
                                                                    attributes:fontAttr];
    [_leftButton setAttributedTitle:attrTitle forState:UIControlStateNormal];
    
    SEL sel = NSSelectorFromString(@"leftButtonClicked");
    
    [_leftButton addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    
    _leftButton.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    [self addSubview:_leftButton];
    
    
    NSString *rightTitle = @"+";
    if (self.rightButtonTitle) {
        rightTitle = self.rightButtonTitle;
    }
    _rightButton = [UIButton new];
    _rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_rightButton setTitle:rightTitle forState:UIControlStateNormal];
    _rightButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_rightButton setEnlargeEdgeWithTop:10 right:40 bottom:10 left:10];
    SEL rightSel = NSSelectorFromString(@"rightButtonClicked");
    
    [_rightButton addTarget:self action:rightSel forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_rightButton];
    
}

- (void)awakeFromNib {
    if (!self.rightButtonTitle) {
        self.rightButton.hidden = YES;
    }
}

//overwrite
- (void)layoutSubviews {
    self.titleLabel.text = self.title;
    NSString *rightTitle = @"+";
    if (self.rightButtonTitle) {
        rightTitle = self.rightButtonTitle;
    }
    [self.rightButton setTitle:rightTitle forState:UIControlStateNormal];
    
    [super layoutSubviews];
}

- (void)layout {
    //@weakify(self)
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //@strongify(self)
        make.width.equalTo(@150);
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(10);
    }];
    
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //@strongify(self)
        
        make.width.equalTo(@25);
        make.height.equalTo(@25);
        make.left.equalTo(self).offset(10);
        make.bottom.equalTo(self).offset(-10);
    }];
    [self.leftButton setEnlargeEdgeWithTop:10 right:30 bottom:10 left:10];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        //@strongify(self)
        make.width.equalTo(@90);
        make.height.equalTo(@40);
        make.trailing.equalTo(self).offset(-10);
        make.centerY.equalTo(self).offset(10);
    }];
}

#pragma mark - Actions
-(void)leftButtonClicked {
    if (self.delegate) {
        [self.delegate leftButtonClicked];
    }
}

-(void)rightButtonClicked {
    if (self.delegate) {
        [self.delegate rightButtonClicked];
    }
}

@end
