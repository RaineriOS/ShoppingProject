//
//  ScreenShotNavViewController.m
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/23.
//  Copyright © 2015年 郑永能. All rights reserved.
//
#define DISTANCETOPOP 80

#import "ScreenShotNavViewController.h"
#import "AppDelegate.h"

@interface ScreenShotNavViewController()<UIGestureRecognizerDelegate>

@end
@implementation ScreenShotNavViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.arrayScreenshot = [NSMutableArray array];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesIng:)];
    _panGes.delegate = self;
    [self.view addGestureRecognizer:_panGes];
}
//滑动的手势是否有效
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.view == self.view) {
        CommonViewController *v = (CommonViewController *)self.topViewController;
        return !v.bSupportPanUI?NO:YES;
    }
    return NO;
}

#pragma mark - panGestureListener
- (void)panGesIng:(UIPanGestureRecognizer *)panGes
{
    
    AppDelegate *appdelegate = [AppDelegate shareInstance];
    
    UIViewController *rootVC = appdelegate.window.rootViewController;
    UIViewController *presentedVC = rootVC.presentedViewController;

    if (self.viewControllers.count == 1)
    {
        return;
    }
    
    if (panGes.state == UIGestureRecognizerStateBegan)
    {
        appdelegate.screenshotView.hidden = NO;
    }
    //手指滑动
    else if (panGes.state == UIGestureRecognizerStateChanged)
    {
        CGPoint pt = [panGes translationInView:self.view];
        if (pt.x >= 10)
        {
            rootVC.view.transform = CGAffineTransformMakeTranslation(pt.x - 10, 0);
            presentedVC.view.transform = CGAffineTransformMakeTranslation(pt.x - 10, 0);
        }
    }
    else if (panGes.state == UIGestureRecognizerStateEnded)
    {
        
        CGPoint pt = [panGes translationInView:self.view];
        if (pt.x >= DISTANCETOPOP)
        {
            [UIView animateWithDuration:0.3 animations:^{
                rootVC.view.transform = CGAffineTransformMakeTranslation(YNScreenWidth, 0);
                presentedVC.view.transform = CGAffineTransformMakeTranslation(YNScreenWidth, 0);
            } completion:^(BOOL finished) {
                [self popViewControllerAnimated:NO];
                rootVC.view.transform = CGAffineTransformIdentity;
                presentedVC.view.transform = CGAffineTransformIdentity;
                appdelegate.screenshotView.hidden = YES;
            }];
        }
        else
        {
            [UIView animateWithDuration:0.3 animations:^{
                rootVC.view.transform = CGAffineTransformIdentity;
                presentedVC.view.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                appdelegate.screenshotView.hidden = YES;
            }];
        }

    }
    
}
//push 控制器
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
#if kPanUISwitch
    
    if (self.viewControllers.count == 0)
        return [super pushViewController:viewController animated:animated];
    
    //截取当前的图片
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(appdelegate.window.size.width, appdelegate.window.size.height), YES, 0);
    [appdelegate.window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //加入到数组中
    [self.arrayScreenshot addObject:viewImage];
    //设置图片为当前的截图图片
    appdelegate.screenshotView.imgView.image = viewImage;
#endif
    [super pushViewController:viewController animated:animated];
}
//外部调用 移除控制器
- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
#if kPanUISwitch
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [self.arrayScreenshot removeLastObject];
    UIImage *image = [self.arrayScreenshot lastObject];
    
    if (image)
        appdelegate.screenshotView.imgView.image = image;
#endif
    UIViewController *v = [super popViewControllerAnimated:animated];
    return v;
}
//外部调用 直接去到跟控制器的方法
- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
#if kPanUISwitch
    AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (self.arrayScreenshot.count > 2)
    {
        [self.arrayScreenshot removeObjectsInRange:NSMakeRange(1, self.arrayScreenshot.count - 1)];
    }
    UIImage *image = [self.arrayScreenshot lastObject];
    if (image)
        appdelegate.screenshotView.imgView.image = image;
#endif
    return [super popToRootViewControllerAnimated:animated];
}
//外部调用 直接到某一个控制器的回调方法
- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSArray *arr = [super popToViewController:viewController animated:animated];
    
    if (self.arrayScreenshot.count > arr.count)
    {
        for (int i = 0; i < arr.count; i++) {
            [self.arrayScreenshot removeLastObject];
        }
    }
    return arr;
}
@end
