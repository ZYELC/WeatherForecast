//
//  WeatherModel.h
//  天气
//
//  Created by qianfeng on 14/5/10.
//  Copyright © 2014年 zhangying. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Pm25Model,WeatherDetailsInfoModel,RealTimeModel;

@interface AllWeatherModel : NSObject

/**
 *  城市名
 */
@property (nonatomic, strong) NSString *city;
/**
 *  城市天气id
 */
@property (nonatomic, strong) NSString *cityid;
/**
 *  各种建议指数
 */
@property (nonatomic, strong) NSMutableArray *indexes;
/**
 *  pm数值
 */
@property (nonatomic, strong) Pm25Model    *pm25;
/**
 *  城市所在省份
 */
@property (nonatomic, strong) NSString *provinceName;
/**
 *  实时天气
 */
@property (nonatomic, strong) RealTimeModel *realtime;
/**
 *  天气详细信息
 */
@property (nonatomic, strong) WeatherDetailsInfoModel *weatherDetailsInfoModel;
/**
 *  7天天气（昨天，今天，之后5天）
 */
@property (nonatomic, strong) NSMutableArray *weathers;


@end
