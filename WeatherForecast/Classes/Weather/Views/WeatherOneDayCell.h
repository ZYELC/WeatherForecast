//
//  WeatherOneDayCell.h
//  WeatherForecast
//
//  Created by qianfeng on 14/5/12.
//  Copyright © 2014年 zhangying. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OneDayModel;

@interface WeatherOneDayCell : UITableViewCell

@property (nonatomic, strong) OneDayModel *model;

+ (NSString *)identifier;

@end
