//
//  UIColor+SNFoundation.h
//  SNFoundation
//
//  Created by liukun on 14-3-2.
//  Copyright (c) 2014年 liukun. All rights reserved.
//

#import <UIKit/UIKit.h>


#undef  RGBCOLOR
//颜色和透明度设置
#define YNRGBA(r,g,b,a) [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
#define YNRGB(r,g,b) [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1]
#define YNRandomColor YNRGBA(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256),1)


#undef	HEX_RGB
#define HEX_RGB(V)		[UIColor colorWithRGBHex:V]

@interface UIColor (SNFoundation)

+ (UIColor *)colorWithRGBHex:(UInt32)hex;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

@end
