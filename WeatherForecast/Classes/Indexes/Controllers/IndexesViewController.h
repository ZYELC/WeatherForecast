//
//  IndexesViewController.h
//  WeatherForecast
//
//  Created by qianfeng on 14/5/14.
//  Copyright © 2014年 zhangying. All rights reserved.
//

#import "BaseViewController.h"

@class Pm25Model,CityModel,RealTimeModel;

@interface IndexesViewController : BaseViewController

@property (nonatomic, strong) Pm25Model *pmModel;

@property (nonatomic, strong) NSArray *indexesArray;

@property (nonatomic, strong) CityModel *cityModel;

@property (nonatomic, strong) RealTimeModel *realTimeModel;

@end
