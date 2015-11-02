//
//  IndexesCollectionViewCell.h
//  WeatherForecast
//
//  Created by qianfeng on 14/5/15.
//  Copyright © 2014年 zhangying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexesCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIButton *level;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) void(^cellBlock)(NSIndexPath *indexPath);

+ (NSString *)identifier;

@end
