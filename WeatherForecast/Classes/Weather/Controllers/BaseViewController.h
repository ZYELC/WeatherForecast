//
//  BaseViewController.h
//  WeatherForecast
//
//  Created by qianfeng on 14/5/19.
//  Copyright © 2014年 zhangying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UIImageView *locationImageView;

- (void)addPopBtn;

@end
