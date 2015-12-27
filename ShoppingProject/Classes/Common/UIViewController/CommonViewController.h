//
//  CommonViewController.h
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/23.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthManagerNavViewController.h"
// 首页 navigation controller
//AuthManagerNavViewController *__gNavController0;
extern NSString *sourceTitle;//来源页面的渠道
extern NSString *sourcePageTitle;//渠道详情
extern NSString *daoTitle;//来源页面的渠道
extern NSString *daoPageTitle;//渠道详情
extern NSString *erWeiMaPageTitle;//渠道详情
extern NSString *erWeiMaDanPageTitle;//渠道详情
extern NSString *remotePageTitle;//渠道详情
extern NSString *searchTitle;//搜索方式

@interface CommonViewController : UITabBarController



@property (nonatomic, assign) BOOL bSupportPanUI;//是否支持拖动pop手势，默认yes



@end
