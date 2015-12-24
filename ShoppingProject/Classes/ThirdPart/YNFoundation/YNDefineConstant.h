//
//  YNDefineConstant.h
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/20.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#ifdef __OBJC__

//宽高
#define YNScreenWidth     [UIScreen mainScreen].bounds.size.width
#define YNScreenHeight    [UIScreen mainScreen].bounds.size.height

//是否为空或是[NSNull null]
#define NotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))

//字符串是否为空
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))
//数组是否为空
#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))

//默认目录
#define userDefaults [NSUserDefaults standardUserDefaults]
//广播
#define Notification [NSNotificationCenter defaultCenter]

//单例创建
#undef	AS_SINGLETON
#define AS_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}

#endif /* YNDefineConstant_h */
