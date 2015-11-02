//
//  WeatherDetailsInfoModel.m
//  WeatherForecast
//
//  Created by qianfeng on 15/10/13.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "WeatherDetailsInfoModel.h"
#import "ThreeHoursWeatherModel.h"

@implementation WeatherDetailsInfoModel

- (void)setWeather3HoursDetailsInfos:(NSArray *)weather3HoursDetailsInfos
{
    _weather3HoursDetailsInfos =[NSMutableArray arrayWithCapacity:0];
    for (NSDictionary *dict in weather3HoursDetailsInfos) {
        ThreeHoursWeatherModel *model = [[ThreeHoursWeatherModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        [_weather3HoursDetailsInfos addObject:model];
    }
}

- (NSInteger)currentTimeIndex
{
    CGFloat currentTime = [self subHourTimeWithDate:_publishTime];
    
    for (int i = 0; i < _weather3HoursDetailsInfos.count; i++) {
        ThreeHoursWeatherModel *model = _weather3HoursDetailsInfos[i];
        CGFloat startTime = [self subHourTimeWithDate:model.startTime];
        CGFloat endTime = [self subHourTimeWithDate:model.endTime];
        
        if ( currentTime >= startTime && currentTime < endTime ) {
            return i;
        }
    }
    
    return -1;
}

- (CGFloat)subHourTimeWithDate:(NSString *)date
{
    NSRange range = [date rangeOfString:@" "];
    NSString *time = [date substringWithRange:NSMakeRange(range.location + 1, 2)];
    
    return [time floatValue];
}

@end
