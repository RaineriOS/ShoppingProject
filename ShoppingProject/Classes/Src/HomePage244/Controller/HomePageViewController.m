//
//  HomePageViewController.m
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/23.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "HomePageViewController.h"
#import "AuthManagerNavViewController.h"
#import "LoginViewController.h"

@interface HomePageViewController ()
{
    UIButton *_loginBtn;
}

@end

@implementation HomePageViewController


-(void)viewDidLoad
{
    [super viewDidLoad];

    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginBtn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_loginBtn];
    [_loginBtn addTarget:self action:@selector(loginBtn) forControlEvents:UIControlEventTouchUpInside];
    //采用自动布局
    [self SDAutoLayout];
    
    
}
//自动布局
- (void)SDAutoLayout
{
    _loginBtn.sd_layout.centerXEqualToView(self.view).centerYEqualToView(self.view)
    .heightIs(40).widthIs(50);
    
}

- (void)loginBtn
{
    
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    loginVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    AuthManagerNavViewController *authManagerNavVC = [[AuthManagerNavViewController alloc]initWithRootViewController:loginVC hasTopRoundCorner:NO];
    
    [self presentViewController:authManagerNavVC animated:YES completion:nil];
    
    
}

@end
