//
//  BaseViewController.m
//  WeatherForecast
//
//  Created by qianfeng on 15/10/19.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createBottmView];
    
    [self createLocationImageView];
    
}

#pragma mark - 创建底栏
- (void)createBottmView{
    
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 40, SCREEN_WIDTH, 40)];
    _bottomView.backgroundColor = [UIColor whiteColor];
//    _bottomView.alpha = 0.5;
    [self.view addSubview:_bottomView];
    
    [_bottomView addSubview:[UIView createHorizontalLineWithOrigin:CGPointMake(10, 0) lineLength:SCREEN_WIDTH - 20 lineColor:COLOR_LIGHTGRAYCOLOR]];
}
#pragma mark 添加返回按钮
- (void)addPopBtn{
    // 返回
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 5, 30, 30)];
    backBtn.tintColor = [UIColor grayColor];
    UIImage *backImage = [[UIImage imageNamed:@"backBtn"]imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [backBtn setBackgroundImage:backImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    [_bottomView addSubview:backBtn];
}

- (void)popViewController{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 初始化定位图片
- (void)createLocationImageView{
    _locationImageView = [UIImageView createImageViewWithFrame:CGRectMake(0, 0, 0, 0) image:[UIImage imageNamed:@"locationIcon"]];
    _locationImageView.center = CGPointMake(SCREEN_WIDTH / 2, _bottomView.height / 2);
    [_bottomView addSubview:_locationImageView];
}

#pragma mark - 取出电池栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
