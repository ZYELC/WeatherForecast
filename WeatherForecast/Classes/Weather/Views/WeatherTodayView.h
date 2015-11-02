//
//  WeatherTodayView.h
//  WeatherForecast
//
//  Created by qianfeng on 14/5/13.
//  Copyright © 2014年 zhangying. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeatherDetailsInfoModel,RealTimeModel,OneDayModel;

@interface WeatherTodayView : UIView

@property (nonatomic, strong) NSString *cityName;

@property (nonatomic, strong) WeatherDetailsInfoModel *weatherDetailsInfoModel;

@property (nonatomic, strong) RealTimeModel *realTimeModel;

@property (nonatomic, strong) OneDayModel *oneDayModel;

- (void)viewWithRealTimeModel:(RealTimeModel *)realTimeModel andWeatherDetailsInfoModel:(WeatherDetailsInfoModel *)weatherDetailsInfoModel;

@end
