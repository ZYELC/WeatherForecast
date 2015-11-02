//
//  UILabel+DM.m
//  WeatherForecast
//
//  Created by qianfeng on 15/10/18.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "UILabel+DM.h"

@implementation UILabel (DM)

/**
 *  创建UILabel
 *
 *  @param frame 尺寸
 *  @param text  文字
 *  @param font  字体
 *
 *  @return 返回UILabel
 */
+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.font = font;
    
    return label;
}
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
+ (instancetype)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)color
{
    UILabel *label = [self labelWithFrame:frame text:text font:font];
    label.textColor = color;
    
    return label;
}


@end
