//
//  CityManageViewController.h
//  天气
//
//  Created by qianfeng on 15/10/9.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "BaseViewController.h"

@protocol CityManageViewControllerDelegate <NSObject>

- (void)cityManagerVCPopToLocationCity;

- (void)changeCurrentChooseCity:(NSInteger)cityIndex;

@end

@interface CityManageViewController : BaseViewController

@property (nonatomic, weak) id<CityManageViewControllerDelegate> delegate;

@end
