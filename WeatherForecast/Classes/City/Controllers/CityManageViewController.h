//
//  CityManageViewController.h
//  天气
//
//  Created by qianfeng on 14/5/9.
//  Copyright © 2014年 zhangying. All rights reserved.
//

#import "BaseViewController.h"

@protocol CityManageViewControllerDelegate <NSObject>

- (void)cityManagerVCPopToLocationCity;

- (void)changeCurrentChooseCity:(NSInteger)cityIndex;

@end

@interface CityManageViewController : BaseViewController

@property (nonatomic, weak) id<CityManageViewControllerDelegate> delegate;

@end
