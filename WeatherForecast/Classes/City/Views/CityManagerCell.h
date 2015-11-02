//
//  CityManagerCell.h
//  天气
//
//  Created by qianfeng on 15/10/9.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CityModel,CityManagerCell;



@interface CityManagerCell : UITableViewCell

@property (nonatomic, strong) CityModel *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (NSString *)identifier;
@end
