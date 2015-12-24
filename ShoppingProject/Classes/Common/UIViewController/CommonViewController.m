//
//  CommonViewController.m
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/23.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "CommonViewController.h"


NSString *sourceTitle;
NSString *sourcePageTitle;//渠道详情
NSString *daoTitle;//来源页面的渠道
NSString *daoPageTitle;//渠道详情
NSString *erWeiMaDanPageTitle;
NSString *erWeiMaPageTitle;//渠道详情
NSString *remotePageTitle;
NSString *searchTitle;


@implementation CommonViewController



#pragma mark - init
- (id)init{
    
    self = [super init];
    
    if (self) {
        
        self.bSupportPanUI = YES;
        
    }
    return self;
}






@end
