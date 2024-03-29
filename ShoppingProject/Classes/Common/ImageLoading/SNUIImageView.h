//
//  SNUIImageView.h
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/22.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <UIKit/UIKit.h>
#define EGOImageView SNUIImageView
@class EGOImageView;
@protocol SNImageLoadOperation;
/**
 *  配置的初始化方法
 */
extern void SNImageCacheConfig(void);
/**
 *  清空图片缓存
 *
 *  @param completion 清除完成的回调
 */
extern void SNImageCacheClearWithCompletion(dispatch_block_t completion);

/**
 *  从网络或缓存中获取图片
 *
 *  @param url             图片url
 *  @param void^completion 获取的图片
 */
extern id<SNImageLoadOperation> SNImageLoadImage(NSURL *url, void(^completion)(UIImage *image));
/**
 *  清空内存缓存
 */
extern void SNImageCacheClearMemory(void);


/**
 *  预加载图片
 *
 *  @param urls 图片url数组
 */
extern void SNImageCachePreloadImages(NSArray *urls);


@protocol SNImageLoadOperation <NSObject>
- (void)cancel;
@end


@protocol EGOImageViewDelegate<NSObject>
@optional
- (void)imageViewLoadedImage:(EGOImageView*)imageView;
- (void)imageViewFailedToLoadImage:(EGOImageView*)imageView error:(NSError*)error;
@end



/**
 *  网络图片imageView的类
 */
@interface SNUIImageView : UIImageView

/** imageURL */
@property (nonatomic, strong) NSURL *imageURL;
/** placeholder */
@property (nonatomic, strong) UIImage *placeholderImage;
/** ImageOptions,  */
@property (nonatomic, assign) NSUInteger cacheOptions;
/** Loading框 */
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
/** 是否展示加载中 */
@property (nonatomic, assign) BOOL shouldShowIndicator;
/** 设置为YES时，cache由NSURLCache管理*/
@property (nonatomic, assign) BOOL refreshCached;
/** 点击事件 */
@property (nonatomic,   copy) void (^touchEndBlock)(SNUIImageView *imgView);


@property (nonatomic, strong)     UIImageView     *topLineImage;
@property (nonatomic, strong)     UIImageView     *rightLineImage;
@property (nonatomic, strong)     UIImageView     *bottomLineImage;
@property (nonatomic, strong)     UIImageView     *leftLineImage;

/**
 *  为验证码图片定制的view
 */
+ (instancetype)captchaView;

@property(nonatomic, weak) id<EGOImageViewDelegate> delegate;

/**
 *  为图片的右边和底边添加一条线
 */
- (void)addRightBottomLine;


/**
 *  为图片的顶部、右侧、底部划线，适合于每个模块的最顶部的图片
 */
- (void)addTopRightBottonLine;

/**
 *  4个边都添加线
 */
- (void)addFullLine;


@end


@class EGOImageViewEx;
@protocol EGOImageViewExDelegate <NSObject>
@optional
- (void)imageExViewDidOk:(EGOImageViewEx *)imageViewEx;
@end

@interface EGOImageViewEx : SNUIImageView
@property (nonatomic, weak) id <EGOImageViewExDelegate> exDelegate;
@end

