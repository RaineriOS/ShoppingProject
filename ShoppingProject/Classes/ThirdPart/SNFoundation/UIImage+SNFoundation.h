//
//  UIImage+SNFoundation.h
//  SNFoundation
//
//  Created by liukun on 14-3-2.
//  Copyright (c) 2014年 liukun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SNFoundation)

+ (UIImage *)noCacheImageNamed:(NSString *)imageName;
//根据颜色创建
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
//拉伸
+ (UIImage *)streImageNamed:(NSString *)imageName;
//指定拉伸
+ (UIImage *)streImageNamed:(NSString *)imageName capX:(CGFloat)x capY:(CGFloat)y;
//拉伸
- (UIImage *)stretched;
//缩放
- (UIImage *)grayscale;
//圆角
- (UIImage *)roundCornerImageWithRadius:(CGFloat)cornerRadius;
//平铺
- (UIColor *)patternColor;

@end
