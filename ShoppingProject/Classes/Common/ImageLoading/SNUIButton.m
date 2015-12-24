//
//  SNUIButton.m
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/21.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "SNUIButton.h"
#import <SDWebImage/UIButton+WebCache.h>
@interface SNUIButton ()

@end

@implementation SNUIButton

+ (instancetype)captchaView
{
    SNUIButton *btn = [[self alloc]init];
        btn.cacheOptions = (SDWebImageRetryFailed|SDWebImageRefreshCached|SDWebImageContinueInBackground|SDWebImageHandleCookies|SDWebImageHighPriority);
    return btn;
}

- (void)setUp
{
    self.placeholderImage = [UIImage imageNamed:@"ebuy_default_image_placeholder"];
    self.shouldShowIndicator = YES;
    self.cacheOptions = (SDWebImageRetryFailed|SDWebImageContinueInBackground);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setUp];
    }
    return self;
}
+ (id)buttonWithType:(UIButtonType)buttonType
{
    id btn = [super buttonWithType:buttonType];
    [btn setUp];
    return btn;
}
- (UIActivityIndicatorView *)indicatorView
{
    if (!_indicatorView) {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicatorView.hidesWhenStopped = YES;
    }
    return _indicatorView;
}

- (void)setRefreshCached:(BOOL)refreshCached
{
    _refreshCached = refreshCached;
    if (_refreshCached) {
        self.cacheOptions |= SDWebImageRefreshCached;
    } else {
        self.cacheOptions &= (0xffff ^ SDWebImageRefreshCached);
    }
}

//setting image url
-(void)setImageURL:(NSURL *)imageURL
{
    
    if (imageURL == nil) {
        
        [self setImage:self.placeholderImage forState:UIControlStateNormal];
        return;
    }
    
    _imageURL = imageURL;
    
    //if indicatorview is yes,then start Animating indicatorview.
    if (self.shouldShowIndicator) {
        [self.indicatorView startAnimating];
    }
    
    //block 里面用到了 self 则需要弱引用
    __weak typeof (self) selfTemp = self;
    [self sd_setBackgroundImageWithURL:imageURL forState:UIControlStateNormal placeholderImage:self.placeholderImage options:self.cacheOptions completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if(selfTemp.shouldShowIndicator) {[selfTemp.indicatorView stopAnimating];}
        if(image)//下载成功
        {
            if([selfTemp.delegate respondsToSelector:@selector(imageButtonLoadedImage:)])
            {
                [selfTemp.delegate imageButtonLoadedImage:selfTemp];
            }
        
        }
        else
        {
            SNLogError(@"ImageLoadError: %@", error);
            if ([selfTemp.delegate respondsToSelector:@selector(imageButtonFailedToLoadImage:error:)]) {
                [selfTemp.delegate imageButtonFailedToLoadImage:selfTemp error:error];
            }
        }
        
    }];
}
/*
- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    
    if (image == self.placeholderImage)
    {
        if (!_adjustedPlaceholder) {
            _adjustedPlaceholder = [EGOPlaceholder adjustPlaceholderImage:image size:self.frame.size];
        }
        image = _adjustedPlaceholder;
    }
    //    [super setImage:image forState:state];
    [super setBackgroundImage:image forState:state];
}
 */
//释放
-(void)dealloc{

    [self sd_cancelImageLoadForState:UIControlStateNormal];
}
- (void)addBottomLineRightOffset{
    //bottom
    UIImageView *horizonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width-5, 0.5)];
    horizonImageView.image = [UIImage streImageNamed:@"line.png"];
    [self addSubview:horizonImageView];
    TT_RELEASE_SAFELY(horizonImageView);
}

-(void)addTopLine{
    self.topLineImage.frame = CGRectMake(0, 0, self.frame.size.width, 0.5);
}

- (void)addBottomLine{

    self.bottomLineImage.frame = CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5);
}
- (void)addRightBottomLine {
    
    self.rightLineImage.frame = CGRectMake(self.frame.size.width-0.5, 0, 0.5, self.frame.size.height);
    self.bottomLineImage.frame = CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5);
    
}


- (void)addTopRightBottomLine {
    
    self.topLineImage.frame = CGRectMake(0, 0, self.frame.size.width, 0.5);
    self.rightLineImage.frame = CGRectMake(self.frame.size.width-0.5, 0, 0.5, self.frame.size.height);
    self.bottomLineImage.frame = CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5);
    
}

- (void)addFullLine {
    
    self.topLineImage.frame = CGRectMake(0, 0, self.frame.size.width, 0.5);
    self.rightLineImage.frame = CGRectMake(self.frame.size.width-0.5, 0, 0.5, self.frame.size.height);
    self.bottomLineImage.frame = CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5);
    self.leftLineImage.frame = CGRectMake(0, 0, 0.5, self.frame.size.height);
    
}
- (UIImageView *)topLineImage {
    if (!_topLineImage) {
        _topLineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0.5)];
        _topLineImage.image = [UIImage streImageNamed:@"line.png"];
        [self addSubview:_topLineImage];
    }
    return _topLineImage;
}


- (UIImageView *)rightLineImage {
    if (!_rightLineImage) {
        _rightLineImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-0.5, 0, 0.5, self.frame.size.height)];
        _rightLineImage.image = [UIImage streImageNamed:@"segment_vertical_line.png"];
        [self addSubview:_rightLineImage];
    }
    return _rightLineImage;
}


- (UIImageView *)bottomLineImage {
    if (!_bottomLineImage) {
        _bottomLineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5)];
        _bottomLineImage.image = [UIImage streImageNamed:@"line.png"];
        [self addSubview:_bottomLineImage];
    }
    return _bottomLineImage;
}


- (UIImageView *)leftLineImage {
    if (!_leftLineImage) {
        _leftLineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0.5, self.frame.size.height)];
        _leftLineImage.image = [UIImage streImageNamed:@"segment_vertical_line.png"];
        [self addSubview:_leftLineImage];
    }
    return _leftLineImage;
}
@end
