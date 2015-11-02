//
//  CityManagerCell.h
//  天气
//
//  Created by qianfeng on 14/5/9.
//  Copyright © 2014年 zhangying. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CityModel,CityManagerCell;



@interface CityManagerCell : UITableViewCell

@property (nonatomic, strong) CityModel *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (NSString *)identifier;
@end
