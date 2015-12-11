//
//  BaseTableViewController.m
//  YaoYDCoach2
//
//  Created by YM on 15/12/2.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "BaseTableViewController.h"
#import <Masonry.h>
#import <MBProgressHUD.h>


#import "NavigationController.h"
@interface BaseTableViewController ()<NavBarViewDelegate,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property(strong, nonatomic) MBProgressHUD *hud;
@end

@implementation BaseTableViewController

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
    
    self.automaticallyAdjustsScrollViewInsets  = NO;
    //导航栏
    _navBarView = [[NavBarView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    _navBarView.delegate = self;
    _navBarView.rightItemView.hidden = YES;
    [((NavigationController *)self.navigationController).swiper.panRecognizer addTarget:self action:@selector(back:)];
    self.tableView.tableHeaderView = _navBarView;
    [self.navBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(64));
        make.width.equalTo(self.tableView);
        make.top.equalTo(self.tableView).offset(0);
        make.centerX.equalTo(self.tableView);
    }];
    [self.tableView bringSubviewToFront:_navBarView];
    _navBarView.leftTitle = @"sd";
    
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.mode = MBProgressHUDModeText;
    [_hud hide:NO];
    
    
    
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
    self.tableView.tableFooterView = [UIView new];
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

#pragma mark - ScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.tableView bringSubviewToFront:_navBarView];
    float topOffset = scrollView.contentOffset.y;
    [self.navBarView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(topOffset));
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

//设置状态栏的（亮色）白色
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - DZNEmpty Delegate

//- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
//    return [UIImage imageNamed:@"xs.png"];
//}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"Please Allow Photo Access";
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f], NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}


- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView{ NSString *text = @"This allows you to share photos from your library and save photos to your camera roll."; NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new]; paragraph.lineBreakMode = NSLineBreakByWordWrapping; paragraph.alignment = NSTextAlignmentCenter; NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f], NSForegroundColorAttributeName: [UIColor lightGrayColor], NSParagraphStyleAttributeName: paragraph}; return [[NSAttributedString alloc] initWithString:text attributes:attributes]; }

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state{ return [UIImage imageNamed:@"tab01_P"];}
- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView{ // Do something
    NSLog(@"DO SomeThing");
    [self.tableView reloadData];
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView{ return [UIColor redColor];}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView{ return YES;}


@end
