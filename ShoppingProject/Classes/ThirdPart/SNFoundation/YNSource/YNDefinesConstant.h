//
//  YNDefinesConstant.h
//  LoveChatHeart
//
//  Created by 粤峰 on 15/12/14.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#ifndef YNDefinesConstant_h
#define YNDefinesConstant_h

//调试状态，打开LOG
#ifdef DEBUG
#define YNLog(...) NSLog(@"%s 行数:%d \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else //发布状态 关闭状态
#define YNLog(...)
#endif


#define YNScreenWidth     [UIScreen mainScreen].bounds.size.width
#define YNScreenHeight    [UIScreen mainScreen].bounds.size.height

//默认目录
#define userDefaults [NSUserDefaults standardUserDefaults]

//广播
#define Notification [NSNotificationCenter defaultCenter]

//是否为空或是[NSNull null]
#define NotNilAndNull(_ref)  (((_ref) != nil) && (![(_ref) isEqual:[NSNull null]]))
#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]))

//字符串是否为空
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))
//数组是否为空
#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))



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

#define YNScreenWidth     [UIScreen mainScreen].bounds.size.width
#define YNScreenHeight    [UIScreen mainScreen].bounds.size.height


#endif /* YNDefinesConstant_h */
