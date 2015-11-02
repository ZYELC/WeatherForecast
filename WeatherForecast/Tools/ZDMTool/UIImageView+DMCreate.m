//
//  UIImageView+DMCreate.m
//  WeatherForecast
//
//  Created by qianfeng on 15/10/16.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "UIImageView+DMCreate.h"

@implementation UIImageView (DMCreate)

#pragma mark - 创建UIImageView
#pragma mark 带圆角的ImageView
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.layer.cornerRadius = cornerRadius;
    imageView.layer.masksToBounds = YES;
    
    return imageView;
}

#pragma mark 创建ImageView并确定图片
+ (instancetype)createImageViewWithFrame:(CGRect)frame image:(UIImage *)image
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = image;
    
    return imageView;
}

#pragma mark 带圆角的ImageView并确定图片
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius image:(UIImage *)image
{
    UIImageView *imageView = [self createImageViewWithFrame:frame cornerRadius:cornerRadius];
    imageView.image = image;

    return imageView;
}

@end
