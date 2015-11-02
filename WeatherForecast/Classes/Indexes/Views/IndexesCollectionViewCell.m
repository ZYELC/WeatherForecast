//
//  IndexesCollectionViewCell.m
//  WeatherForecast
//
//  Created by qianfeng on 15/10/15.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "IndexesCollectionViewCell.h"

@implementation IndexesCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
    _title.adjustsFontSizeToFitWidth = YES;
    _level.titleLabel.numberOfLines = 0;
    _level.layer.borderWidth = 1;
    _level.layer.borderColor = COLOR_LIGHTGRAYCOLOR.CGColor;
}

+ (NSString *)identifier
{
    return @"indexesCell";
}
- (IBAction)cellClick:(UIButton *)sender {
    
    if (_cellBlock) {
        _cellBlock(_indexPath);
    }
    
}

@end
