//
//  WeatherOneDayCell.h
//  WeatherForecast
//
//  Created by qianfeng on 15/10/12.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OneDayModel;

@interface WeatherOneDayCell : UITableViewCell

@property (nonatomic, strong) OneDayModel *model;

+ (NSString *)identifier;

@end
