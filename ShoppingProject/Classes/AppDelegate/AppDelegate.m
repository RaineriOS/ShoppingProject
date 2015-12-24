//
//  AppDelegate.m
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/16.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "AppDelegate.h"
#import "DAO.h"
#import "TabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    //开启日志
    [self startLogger];
    
    //配置SD_webimage
    SNImageCacheConfig();
    
    /*建表*/
    [DAO createTablesNeeded];
    
    
    
    /*初始化视图*/
    CGRect frame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame:frame];
     self.window.backgroundColor = [UIColor blackColor];
    
    _tabBarViewController = [[TabBarController alloc] init];
    self.window.rootViewController = _tabBarViewController;
  
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

//开启日志
- (void)startLogger{
    #ifdef DEBUG
        [SNLogger startWithLogLevel:SNLogLevelDEBUG];
    #else
        [SNLogger startWithLogLevel:SNLogLevelOFF];
    #endif
}


+ (instancetype)shareInstance
{
    return [[UIApplication sharedApplication] delegate];
}

- (void)applicationWillResignActive:(UIApplication *)application {
  
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  
}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
