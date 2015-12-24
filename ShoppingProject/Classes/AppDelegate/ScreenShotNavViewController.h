//
//  ScreenShotNavViewController.h
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/23.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScreenShotNavViewController : UINavigationController
//图片数组
@property (strong ,nonatomic) NSMutableArray *arrayScreenshot;
//手势
@property (nonatomic, strong) UIPanGestureRecognizer *panGes;
@end
