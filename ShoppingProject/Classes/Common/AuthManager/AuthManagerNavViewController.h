//
//  AuthManagerNavViewController.h
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/24.
//  Copyright © 2015年 郑永能. All rights reserved.
//



#if kPanUISwitch
#import "ScreenShotNavViewController.h"
@interface AuthManagerNavViewController : ScreenShotNavViewController <UINavigationControllerDelegate>
{
    BOOL isLastStatus;
}
#else
@interface AuthManagerNavViewController : UINavigationController <UINavigationControllerDelegate>
{
    BOOL isLastStatus;
}

#endif

@property (nonatomic,strong) UIView *backgroundView;

- (BOOL)needLogonAuth:(UIViewController *)viewController;

- (BOOL)isLotteryController:(UIViewController *)viewController;

- (void)setNavigationBackground:(BOOL)isLottery;

- (void)setNavBarBackgoundWithColor:(UIColor *)color;

- (id)initWithRootViewController:(UIViewController *)rootViewController hasTopRoundCorner:(BOOL)isTopRound;

@end
