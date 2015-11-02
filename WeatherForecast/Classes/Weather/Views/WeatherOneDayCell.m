//
//  WeatherOneDayCell.m
//  WeatherForecast
//
//  Created by qianfeng on 15/10/12.
//  Copyright © 2015年 qianfeng. All rights reserved.
//
#import "OneDayModel.h"
#import "WeatherOneDayCell.h"



@interface WeatherOneDayCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *weekLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *sunRiseAndDownTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UILabel *noDataLabel;

@end

@implementation WeatherOneDayCell

static NSString *cellID = @"WeatherOneDayCell";

+ (NSString *)identifier
{
    return cellID;
}

- (void)awakeFromNib {
    // Initialization cod
    
    _iconImageView.center = CGPointMake(SCREEN_WIDTH / 2, self.height / 2);
    
}

- (void)setModel:(OneDayModel *)model
{
    _model = model;
    
    if (model) {
        _iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"day_%02d",[model.img intValue]]];
        _weekLabel.text = model.name;
        _weatherLabel.text = model.weather;
        _dateLabel.text = model.date;
        _sunRiseAndDownTimeLabel.text = [NSString stringWithFormat:@"↑%@ ↓%@",model.sun_rise_time,model.sun_down_time];
        _tempLabel.text = [NSString stringWithFormat:@"%@°C/%@°C",model.temp_day_c,model.temp_night_c];
        _windLabel.text = [NSString stringWithFormat:@"%@%@",model.wd,model.ws];
        
        _noDataLabel.text = @"";
    }
    else
    {
        _iconImageView.image = [UIImage imageNamed:@""];
        _weekLabel.text = @"";
        _weatherLabel.text = @"";
        _dateLabel.text = @"";
        _sunRiseAndDownTimeLabel.text = @"";
        _tempLabel.text = @"";
        _windLabel.text = @"";
        _noDataLabel.text = @"N/A";
    }
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
