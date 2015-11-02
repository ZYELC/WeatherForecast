//
//  Pm25View.h
//  WeatherForecast
//
//  Created by qianfeng on 14/5/15.
//  Copyright © 2014年 zhangying. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Pm25Model;

@interface Pm25View : UIView

@property (nonatomic, strong) NSString *cityName;

@property (nonatomic, strong) Pm25Model *pm25Model;

@end
