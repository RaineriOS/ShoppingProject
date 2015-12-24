//
//  TabBarController.h
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/23.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarController : UITabBarController<UITabBarControllerDelegate,UITabBarDelegate>


@property (nonatomic, weak) id            tabBarDelegate;

/**
 *  检查是否已经登录
 */
- (BOOL)checkUserLoginOrNot;


/**
 *  显示底部数字
 */
- (void)showBadgeValue:(NSString*)number;



@end
