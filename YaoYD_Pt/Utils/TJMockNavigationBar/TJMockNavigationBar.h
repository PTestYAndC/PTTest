//
//  TJMockNavigationBar.h
//  YaoYDCoach
//
//  Created by holin on 7/20/15.
//  Copyright (c) 2015 1YD.ME. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TJMockNavigationBarDelegate <NSObject>

-(void)leftButtonClicked;
-(void)rightButtonClicked;

@end

IB_DESIGNABLE
@interface TJMockNavigationBar : UIView

@property (nonatomic, strong) IBInspectable NSString *title;
@property (nonatomic, strong) IBInspectable NSString *rightButtonTitle;
@property (nonatomic, strong) IBOutlet id<TJMockNavigationBarDelegate> delegate;

@end
