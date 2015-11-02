//
//  WeatherModel.m
//  天气
//
//  Created by qianfeng on 14/5/10.
//  Copyright © 2014年 zhangying. All rights reserved.
//

#import "AllWeatherModel.h"
#import "IndexesModel.h"
#import "OneDayModel.h"
#import "WeatherDetailsInfoModel.h"
#import "ThreeHoursWeatherModel.h"
#import "Pm25Model.h"
#import "RealTimeModel.h"

@implementation AllWeatherModel

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"weathers"]) {
        _weathers = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dict in value) {
            OneDayModel *model = [[OneDayModel alloc] init];
            [model setValuesForKeysWithDictionary:dict];
            [_weathers addObject:model];
        }
    }
    else if([key isEqualToString:@"indexes"])
    {
        _indexes = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dict in value) {
            IndexesModel *model = [[IndexesModel alloc] init];
            [model setValuesForKeysWithDictionary:dict];
            [_indexes addObject:model];
        }
    }
    else if ([key isEqualToString:@"pm25"]){
        _pm25 = [[Pm25Model alloc] init];
        [_pm25 setValuesForKeysWithDictionary:value];
    }
    else if([key isEqualToString:@"weatherDetailsInfo"]){
        _weatherDetailsInfoModel = [[WeatherDetailsInfoModel alloc] init];
        [_weatherDetailsInfoModel setValuesForKeysWithDictionary:value];
    }
    else if ([key isEqualToString:@"cityid"]){
        _cityid = [NSString stringWithFormat:@"%@",value];
    }
    else if([key isEqualToString:@"realtime"])
    {
        _realtime = [[RealTimeModel alloc]init];
        [_realtime setValuesForKeysWithDictionary:value];
    }
    else
    {
        [super setValue:value forKey:key];
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

@end
