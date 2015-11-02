//
//  UIImageView+DMCreate.h
//  WeatherForecast
//
//  Created by qianfeng on 15/10/16.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (DMCreate)

/**
 *  创建带圆角的UIImageView
 *
 *  @param frame        位置，大小
 *  @param cornerRadius 圆角度数
 *
 *  @return 返回UIImageView
 */
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius;

/**
 *  创建UIImageView并附上图片
 *
 *  @param frame frame
 *  @param image 图片
 *
 *  @return UIImageView的实例
 */
+ (instancetype)createImageViewWithFrame:(CGRect)frame image:(UIImage *)image;

/**
 *  创建带圆角的UIImageView
 *
 *  @param frame        位置，大小
 *  @param cornerRadius 圆角度数
 *  @param image        图片
 *
 *  @return 返回UIImageView
 */
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius image:(UIImage *)image;

@end
