//
//  BaseViewController.m
//  JJ
//
//  Created by YM on 15/11/12.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "BaseViewController.h"
#import <Masonry.h>
#import <MBProgressHUD.h>

#import "NavigationController.h"
@interface BaseViewController ()<NavBarViewDelegate>

@property(strong, nonatomic) MBProgressHUD *hud;


@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self basePerpareNotification];
    [self basePerpareData];
    [self basePerpareUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc{
    [self baseRemoveObserverInVC];
}

#pragma mark -----初始化---------

//注册监听
- (void)basePerpareNotification{
    //监听网络状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noNetWorkConfig) name:kNotificationNoNetWorkStatus object:nil];
}

//数据初始化
- (void)basePerpareData{
    _cancelRequsetWhenBack = NO;
    //存放当前 vc 到 NSUserDefaults 中
    [[NSUserDefaults standardUserDefaults] setObject:NSStringFromClass([self class]) forKey:CurrentVC];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//准备UI
- (void)basePerpareUI{
    _navBarView = [[NavBarView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    [self.view addSubview:_navBarView];
    _navBarView.delegate = self;
    _navBarView.rightItemView.hidden = YES;
    [((NavigationController *)self.navigationController).swiper.panRecognizer addTarget:self action:@selector(back:)];
    
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.mode = MBProgressHUDModeText;
    [_hud hide:NO];
}

//没有网络的配置
- (void)noNetWorkConfig{
    //重写此方法...
}

#pragma mark ------返回-----------
//返回
- (void)back:(id)sender{
    [self baseCancelRequsetInVC];
    [self baseRemoveObserverInVC];
    if (self.navigationController != nil &&
        [self.navigationController.viewControllers firstObject] != self) {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)rightItemClick:(id)sender{

}

//取消所有网络请求
- (void)baseCancelRequsetInVC{
    if (_cancelRequsetWhenBack) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationCancelRequsetsInVC object:NSStringFromClass([self class])];
    }
}

//移除观察者
- (void)baseRemoveObserverInVC{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)cancelAllRequest{
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationCancelAllRequsets object:nil];
}

#pragma mark --------NavBarViewDelegate-----------

- (void)navBarView:(NavBarView *)navBarView leftClicked:(id)sender{
    [self back:sender];
}

- (void)navBarView:(NavBarView *)navBarView rightClicked:(id)sender{
    [self rightItemClick:sender];
}

#pragma mark -------提示框显示-----------

- (void)showFadeTips:(NSString *)msg {
    [self showTips:msg];
    [self hideTipsAfterDelay];
}

- (void)showFastFadeTips:(NSString *)msg withDelay:(int)delay{
    [self showTips:msg];
    [self hideTipsAfterDelay:delay];
}

- (void)showTips:(NSString *)msg {
    [self hideTips];
    _hud.labelText = msg;
}
- (void)hideTips {
    [_hud hide:YES];
}
- (void)hideTipsAfterDelay {
    [_hud hide:YES afterDelay:2];
}

- (void)hideTipsAfterDelay:(int)second {
    [_hud hide:YES afterDelay:second];
}


//设置状态栏的（亮色）白色
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
