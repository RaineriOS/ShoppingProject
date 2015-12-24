//
//  TabBarController.m
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/23.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "TabBarController.h"
#import "HomePageViewController.h"
#import "AuthManagerNavViewController.h"
#import "NewSearchViewController.h"
#import "CategoryViewController.h"
#import "AllCategoryViewController.h"
#import "ShopCartV2ViewController.h"
#import "MyEbuyViewController.h"
@interface TabBarController ()

@property (nonatomic, strong) UIButton *badgeValueBtn;
//是否是第一次进入
@property (nonatomic, assign) BOOL firestIn;
@end
@implementation TabBarController


-(instancetype)init{
    self = [super init];
    if (self) {
        
    _firestIn = YES;
    
        //启动专题列表请求
        sourceTitle = L(@"APPDelegate_Activity");
        UITabBarItem *item1 = [[UITabBarItem alloc] init];
        item1.tag = 1;
        
        [item1 setTitle:L(@"home")];
        [item1 setImage:[UIImage imageNamed:@"icon_homePage244_default.png"]];
        [item1 setSelectedImage:[[UIImage imageNamed:@"icon_homePage244_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item1 setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor orangeColor]}
                             forState:UIControlStateSelected];
       
        UITabBarItem *item2 = [[UITabBarItem alloc] init];
        item2.tag = 2;
        [item2 setTitle:L(@"search")];
        [item2 setImage:[UIImage imageNamed:@"icon_search244_default.png"]];
        [item2 setSelectedImage:[[UIImage imageNamed:@"icon_search244_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item2 setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor orangeColor]}
                             forState:UIControlStateSelected];
        
        UITabBarItem *item3 = [[UITabBarItem alloc] init];
        item3.tag = 3;
        [item3 setTitle:L(@"Categories")];
        [item3 setImage:[UIImage imageNamed:@"icon_category244_default.png"]];
        [item3 setSelectedImage:[[UIImage imageNamed:@"icon_category244_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [item3 setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor orangeColor]}
                             forState:UIControlStateSelected];

        UITabBarItem *item4 = [[UITabBarItem alloc] init];
        item4.tag = 4;
        
            [item4 setTitle:L(@"shopCart")];
            [item4 setImage:[UIImage imageNamed:@"icon_shopCart244_default.png"]];
            [item4 setSelectedImage:[[UIImage imageNamed:@"icon_shopCart244_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
            [item4 setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor orangeColor]}
                             forState:UIControlStateSelected];

            UITabBarItem *item5 = [[UITabBarItem alloc] init];
            item5.tag = 5;
            [item5 setTitle:L(@"myEbuy")];
            [item5 setImage:[UIImage imageNamed:@"icon_myYigou244_default.png"]];
            [item5 setSelectedImage:[[UIImage imageNamed:@"icon_myYigou244_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
            [item5 setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor orangeColor]}
                             forState:UIControlStateSelected];
        
            HomePageViewController *homeController = [[HomePageViewController alloc] init];
            homeController.tabBarItem = item1;
            AuthManagerNavViewController *homeNavController = [[AuthManagerNavViewController alloc] initWithRootViewController:homeController];
            //__gNavController0 = homeNavController; // XZoscar 2014-06-18 add
        
            
            
            NewSearchViewController *searchVC = [[NewSearchViewController alloc] init];
            
            searchVC.tabBarItem = item2;
            
            AuthManagerNavViewController *searchNavController = [[AuthManagerNavViewController alloc] initWithRootViewController:searchVC];
        
        
#if kCategoryDebug
        CategoryViewController *cateViewVC = [[CategoryViewController alloc] init];
        
        cateViewVC.tabBarItem = item3;
        
        AuthManagerNavViewController *cateNavController = [[AuthManagerNavViewController alloc] initWithRootViewController:cateViewVC];
        
        TT_RELEASE_SAFELY(cateViewVC);
        
#else
        AllCategoryViewController *cateViewVC = [[AllCategoryViewController alloc] init];
        //<<<<<<<<<<<<<<<<<<<<<<<<< - - - - - - -TODO
        //cateViewVC.hasSuspendButton = NO;
        cateViewVC.tabBarItem = item3;
        
        AuthManagerNavViewController *cateNavController = [[AuthManagerNavViewController alloc] initWithRootViewController:cateViewVC];
        
        TT_RELEASE_SAFELY(cateViewVC);
        
#endif
        /**
         *  这里已经被注释了 《》《》《》《》《》
         */
        //ShopCartV2ViewController *shoppingCartVC = [ShopCartV2ViewController sharedShopCart];
        ShopCartV2ViewController *shoppingCartVC = [[ShopCartV2ViewController alloc]init];
        
        shoppingCartVC.tabBarItem = item4;
        
        AuthManagerNavViewController *gouwucheNavController = [[AuthManagerNavViewController alloc] initWithRootViewController:shoppingCartVC];
        
        TT_RELEASE_SAFELY(shoppingCartVC);
        MyEbuyViewController * MyEbuyLaunchViewVC = [[MyEbuyViewController alloc] init];
        
        MyEbuyLaunchViewVC.tabBarItem = item5;
        AuthManagerNavViewController *myEbuyNavController = [[AuthManagerNavViewController alloc] initWithRootViewController:MyEbuyLaunchViewVC];
        
        self.viewControllers = [NSArray arrayWithObjects:homeNavController,searchNavController,cateNavController,gouwucheNavController,myEbuyNavController, nil];
        
        self.delegate = self;
        
        //TODO ->  这里已经被注释了
        //[[NSNotificationCenter defaultCenter] addObserver:self
          //                                       selector:@selector(loginSessionFailure)
            //                                         name:LOGIN_SESSION_FAILURE_NEED_LOGIN
              //                                     object:nil];
    }
        return  self;
}


#pragma mark - release
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
