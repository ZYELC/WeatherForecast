//
//  UILabel+DM.h
//  WeatherForecast
//
//  Created by qianfeng on 15/10/18.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (DM)

/**
 *  创建UILabel
 *
 *  @param frame 尺寸
 *  @param text  文字
 *  @param font  字体
 *
 *  @return 返回UILabel
 */
+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font;
/**
 *  创建UILabel
 *
 *  @param frame 尺寸
 *  @param text  文字
 *  @param font  字体
 *  @param color 字体颜色
 *
 *  @return 返回UILabel
 */
+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color;

@end
