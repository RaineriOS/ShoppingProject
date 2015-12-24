//
//  AppDelegate.h
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/16.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScreenShotView.h"
#import "TabBarController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//底部tabbar
@property (nonatomic, readonly, strong) TabBarController *tabBarViewController;

//获取到当前的AppDelegate
+ (instancetype)shareInstance;

#if kPanUISwitch
@property (strong, nonatomic) ScreenShotView *screenshotView;
#endif


@end

