//
//  WeatherDetailsInfoModel.h
//  WeatherForecast
//
//  Created by qianfeng on 14/5/13.
//  Copyright © 2014年 zhangying. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherDetailsInfoModel : NSObject

@property (nonatomic, strong) NSString *publishTime;

@property (nonatomic, strong) NSMutableArray *weather3HoursDetailsInfos;

- (NSInteger)currentTimeIndex;

@end
