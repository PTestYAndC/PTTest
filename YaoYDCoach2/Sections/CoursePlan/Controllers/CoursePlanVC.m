//
//  CoursePlanVC.m
//  YaoYDCoach2
//
//  Created by YM on 15/11/27.
//  Copyright © 2015年 YM. All rights reserved.
//

#import "CoursePlanVC.h"
#import <Masonry.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

@interface CoursePlanVC ()<UIWebViewDelegate>

@end

@implementation CoursePlanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    

    self.tableView.emptyDataSetSource = nil;
    self.tableView.emptyDataSetDelegate = nil;
    self.tableView.tableFooterView = [UIView new];
//    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
//    v.backgroundColor = [UIColor yellowColor];
//    [self.tableView addSubview:v];
//    [v mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(self.tableView);
//        make.top.equalTo(self.tableView.tableHeaderView);
//        make.bottom.equalTo(self.view);
//        make.centerX.equalTo(self.tableView);
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dd"];
    if (!cell ) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"dd"];
    }
    cell.textLabel.text = [@(indexPath.row) stringValue];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self loadWebView];
}

- (void)loadWebView{
    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, SCREEN_HEIGHT-80)];
//    NSString *str1 = @"http://m2.superfa.cn/#/product/detail/7888d372-8e9d-11e5-b27b-00163e0e2df9?share=1&name=幸福娟子&avatar=http%3A%2F%2Fwx.qlogo.cn%2Fmmopen%2FmOW261WJzibsU4CcSIKojJxnSUM2p8YfHyVGmiciaqRmYnen3djqPCDBLWFIwicTXONsQhqR0mGic7Pw7lodNTR41MtsY6nLyG4nZ%2F0&mobile=15821963185";
    
       NSString *str1 = @"http://url.cn/XWAawf";
    
//    NSString *str2 = [str1   stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"!$&'()*+,-./:;=?@_~%#[]"]];
    
    NSString *str2 = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            
                                            (CFStringRef)str1,
                                            
                                            (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                            
                                            NULL,
                                            
                                            kCFStringEncodingUTF8));

    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:str2]];
    web.delegate = self;
    [self.view addSubview:web];
    [web loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"request %@",request);
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
