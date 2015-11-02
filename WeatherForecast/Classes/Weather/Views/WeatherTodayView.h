//
//  WeatherTodayView.h
//  WeatherForecast
//
//  Created by qianfeng on 15/10/13.
//  Copyright © 2015年 qianfeng. All rights reserved.
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
