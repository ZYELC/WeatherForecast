//
//  BaseViewController.h
//  WeatherForecast
//
//  Created by qianfeng on 15/10/19.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UIImageView *locationImageView;

- (void)addPopBtn;

@end
