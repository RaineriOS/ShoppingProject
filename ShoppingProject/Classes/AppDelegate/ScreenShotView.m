//
//  ScreenShotView.m
//  ShoppingProject
//
//  Created by 粤峰 on 15/12/23.
//  Copyright © 2015年 郑永能. All rights reserved.
//

#import "ScreenShotView.h"

@implementation ScreenShotView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.arrayImage = [NSMutableArray array];
        self.backgroundColor = [UIColor blackColor];
        self.imgView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        self.maskView = [[UIView alloc] initWithFrame:self.bounds];
        
        _maskView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0.4];
        
        [self addSubview:_imgView];
        [self addSubview:_maskView];
        
    }
    return self;
}
//动画改变
- (void)showEffectChange:(CGPoint)pt
{

    if (pt.x > 0) {
        //动态改变BackgroundColor alpha
        _maskView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:-pt.x / YNScreenWidth * 0.4 + 0.4];
        _imgView.transform = CGAffineTransformMakeScale(0.95 + (pt.x / YNScreenWidth * 0.05), 0.95 + (pt.x / YNScreenWidth * 0.05));
    }
}
//重置
- (void)restore
{
    if (_maskView && _imgView)
    {
        _maskView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0.4];
        _imgView.transform = CGAffineTransformMakeScale(0.95, 0.95);
    }
}



@end
