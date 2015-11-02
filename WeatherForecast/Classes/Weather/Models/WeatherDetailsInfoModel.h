//
//  WeatherDetailsInfoModel.h
//  WeatherForecast
//
//  Created by qianfeng on 15/10/13.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherDetailsInfoModel : NSObject

@property (nonatomic, strong) NSString *publishTime;

@property (nonatomic, strong) NSMutableArray *weather3HoursDetailsInfos;

- (NSInteger)currentTimeIndex;

@end
