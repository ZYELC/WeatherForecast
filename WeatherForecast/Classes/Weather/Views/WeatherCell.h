//
//  WeatherCell.h
//  WeatherForecast
//
//  Created by qianfeng on 15/10/12.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AllWeatherModel,WeatherCell,CityModel;

@protocol WeatherCellDelegate <NSObject>

- (void)weatherCell:(WeatherCell *)weatherCell loadDataWithCityModel:(CityModel *)cityModel;

@end

@interface WeatherCell : UICollectionViewCell

@property (nonatomic, weak) id<WeatherCellDelegate> delegate;

@property (nonatomic, strong) CityModel *cityModel;

@property (nonatomic, strong) AllWeatherModel *model;

- (void)endHeaderView;

+ (NSString *)identifier;

- (void)setBackgroundImageViewWithImage:(UIImage *)image;

@end
