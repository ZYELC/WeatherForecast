//
//  UIAlertController+DM.h
//  WeatherForecast
//
//  Created by qianfeng on 14/5/17.
//  Copyright © 2014年 zhangying. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AlertControlerBlock)(void);

@interface UIAlertController (DM)

/**
 *  显示提示信息
 *
 *  @param message 需要显示的信息
 *  @param target  目标
 */
+ (void)showAlertViewWithMessage:(NSString *)message target:(id)target;

/**
 *  提示
 *
 *  @param message 提示信息
 *  @param target  目标
 *  @param handler 点击确定后的事件
 */
+ (void)showAlertViewWithMessage:(NSString *)message target:(id)target handler:(AlertControlerBlock)handler;

@end
