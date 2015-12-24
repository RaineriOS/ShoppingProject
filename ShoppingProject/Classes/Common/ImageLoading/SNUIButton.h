//
//  SNUIButton.h
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/21.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import <UIKit/UIKit.h>


#define EGOImageButton SNUIButton
@class EGOImageButton;
//按钮代理
@protocol EGOImageButtonDelegate <NSObject>
@optional
- (void)imageButtonLoadedImage:(EGOImageButton *)imageButton;
- (void)imageButtonFailedToLoadImage:(EGOImageButton *)imageButton error:(NSError*)error;

@end
//对sd_web的封装
@interface SNUIButton : UIButton
{
    
}
/** delegate*/
@property(nonatomic, weak) id<EGOImageButtonDelegate> delegate;

/** imageURL */
@property (nonatomic, strong) NSURL *imageURL;

/** placeholder */
@property (nonatomic, strong) UIImage *placeholderImage;
/** ImageOptions */
@property (nonatomic, assign) NSUInteger cacheOptions;
/** Loading框 */
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
/** 是否展示加载中 */
@property (nonatomic, assign) BOOL shouldShowIndicator;
/** 设置为YES时，cache由NSURLCache管理*/
@property (nonatomic, assign) BOOL refreshCached;


@property (nonatomic, strong)     UIImageView     *topLineImage;
@property (nonatomic, strong)     UIImageView     *rightLineImage;
@property (nonatomic, strong)     UIImageView     *bottomLineImage;
@property (nonatomic, strong)     UIImageView     *leftLineImage;

/**
 *  为图片的底边和右边添加一条线，底边左离button的左边距离5
 */
- (void)addRightBottomLineLeftOffset;

/**
 *  为图片的左边添加一条线
 */
- (void)addLeftLine;

/**
 *  为图片的顶边添加一条线
 */
- (void)addTopLine;

/**
 *  为图片的底边添加一条线
 */
- (void)addBottomLine;

/**
 *  为图片的右边和底边添加一条线
 */
- (void)addRightBottomLine;

/**
 *  为图片的顶部、右边、底边添加一条线
 */
- (void)addTopRightBottomLine;

/**
 *  4个边都添加线
 */
- (void)addFullLine;


@end
