//
//  UIView+DMCreate.h
//  WeatherForecast
//
//  Created by qianfeng on 15/10/16.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DMCreate)

/**
 *  创建UIView并添加颜色
 *
 *  @param frame 位置大小
 *  @param color 颜色
 *
 *  @return UIView的实例
 */
+ (instancetype)createViewWithFrame:(CGRect)frame color:(UIColor *)color;

/**
 *  创建一条宽度为1的横线
 *
 *  @param origin    位置
 *  @param lineLength 长度
 *  @param color     颜色
 *
 *  @return UIView
 */
+ (instancetype)createHorizontalLineWithOrigin:(CGPoint)origin lineLength:(CGFloat)lineLength lineColor:(UIColor *)color;

/**
 *  创建一条宽度为1的横线并添加到他的父视图上
 *
 *  @param origin     位置
 *  @param lineLength 长度
 *  @param color      颜色
 *  @param superView  添加到的父视图
 */
+ (void)createHorizontalLineWithOrigin:(CGPoint)origin lineLength:(CGFloat)lineLength lineColor:(UIColor *)color toView:(UIView *)superView;

/**
 *  创建一条宽度为1的竖线
 *
 *  @param origin     位置
 *  @param lineLength 长度
 *  @param color      颜色
 *
 *  @return UIView
 */
+ (instancetype)createVerticalLineWithOrigin:(CGPoint)origin lineLength:(CGFloat)lineLength lineColor:(UIColor *)color;

/**
 *  创建一条宽度为1的横线并添加到他的父视图上
 *
 *  @param origin     位置
 *  @param lineLength 长度
 *  @param color      颜色
 *  @param superView  添加到的父视图
 */
+ (void)createVerticalLineWithOrigin:(CGPoint)origin lineLength:(CGFloat)lineLength lineColor:(UIColor *)color toView:(UIView *)superView;


@end
