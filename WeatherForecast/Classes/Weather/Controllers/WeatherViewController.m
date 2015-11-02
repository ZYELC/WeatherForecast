//
//  WeatherViewController.m
//  天气
//
//  Created by qianfeng on 14/5/10.
//  Copyright © 2014年 zhangying. All rights reserved.
//

#import "WeatherViewController.h"
#import "CityManageViewController.h"
#import "IndexesViewController.h"
#import "AllWeatherModel.h"
#import "WeatherCell.h"
#import "CityModel.h"
#import "RealTimeModel.h"
#import "OneDayModel.h"

#import <CoreLocation/CoreLocation.h>

@interface WeatherViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate,CityManageViewControllerDelegate,WeatherCellDelegate>

@property (nonatomic, strong) AppDelegate *delegate;
/**
 *  UICollectionView
 */
@property (nonatomic, strong) UICollectionView *collectionView;
/**
 *  分页控制器
 */
@property (nonatomic, strong) UIPageControl    *pageControl;
/**
 *  当前显示的城市序号
 */
@property (nonatomic, assign) int              currentCityIndex;

@property (nonatomic, strong) UIButton         *cityManagerBtn;
@property (nonatomic, strong) UIButton         *indexesBtn;
@end

@implementation WeatherViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [AppDelegate parseData];
    
    [_collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];

    [self reloadPageControl];
    
}

#pragma mark - 加载视图
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"天气";
    self.view.backgroundColor = COLOR_WHITECOLOR;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _delegate = [UIApplication sharedApplication].delegate;
    _delegate.weatherArray = [NSMutableArray array];
    // 解析数据，获得cityArray
    [AppDelegate parseData];
    
    // 创建界面
    [self createUI];
    
    // 加载数据
    [self loadWeatherData];
    
    self.currentCityIndex = 0;
}


#pragma mark - 获取需要现实的城市的天气信息
- (void)loadWeatherData
{
    // 由于参数的顺序不同，得到的数据的顺序不同，因此需要按数组中的数据顺序拼接url
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@?",kWeather];
    for (CityModel *model in _delegate.cityArray) {
        [url appendFormat:@"cityIds=%@&",model.code];
    }
    url = [[url substringToIndex:url.length - 1] mutableCopy];
    
    NSLog(@"url -- %@",url);
    
    [ZDMTool sendAFNetworkGet:url parameters:nil success:^(id responseObject) {
        
        NSArray *value = responseObject[@"value"];
        NSLog(@"value -- %@",value);
        
        for (NSDictionary *cityWeather in value) {
            AllWeatherModel *model = [[AllWeatherModel alloc] init];
            [model setValuesForKeysWithDictionary:cityWeather];
            [_delegate.weatherArray addObject:model];
        }
        
        [_collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
        
    } failure:^(NSError *error) {
        NSLog(@"error -- %@",error.localizedDescription);
    }];
    
}



#pragma mark - 创建界面
- (void)createUI
{
    // 创建UICollectionView
    [self createCollectionView];
    
    // 建导航控制栏上面的城市按钮
    [self createBottomButton];
    
    // 创建分页视图PageControl
    [self createPageControl];
}

#pragma mark 创建导航控制栏上面的城市按钮
- (void)createBottomButton
{
    // 城市列表按钮
    UIButton *cityManagerBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 50 , 5, 30, 30)];
//    cityManagerBtn.backgroundColor = [UIColor redColor];
    [cityManagerBtn setBackgroundImage:[UIImage imageNamed:@"CityManagerICon"] forState:UIControlStateNormal];
    [cityManagerBtn addTarget:self action:@selector(pushCityManageViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:cityManagerBtn];
    self.cityManagerBtn = cityManagerBtn;
    
    // 城市指数按钮
    UIButton *indexesBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 5, 30, 30)];
    [indexesBtn setBackgroundImage:[UIImage imageNamed:@"IndexesIcon"] forState:UIControlStateNormal];
    [indexesBtn addTarget:self action:@selector(pushIndexesViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:indexesBtn];
    self.indexesBtn = indexesBtn;
    
}
#pragma mark push城市页面
- (void)pushCityManageViewController{
    CityManageViewController *manager = [[CityManageViewController alloc] init];
    manager.delegate = self;
    [self.navigationController pushViewController:manager animated:YES];
}
#pragma mark push指数页面
- (void)pushIndexesViewController
{
    IndexesViewController *indexesVC = [[IndexesViewController alloc] init];
    
    CityModel *model = nil;
    if (_delegate.currentCityModel) {
        
        if (_currentCityIndex == 0) {
            model = _delegate.currentCityModel;
        }
        else
        {
            model = _delegate.cityArray[_currentCityIndex - 1];
        }
    }
    else
    {
        if(_delegate.cityArray.count > 0)
        {
            model = _delegate.cityArray[_currentCityIndex];
        }
    }
    
    indexesVC.cityModel = model;
    // 找到对应城市的信息
    AllWeatherModel *allModel  = [AppDelegate findAllWeatherModelByCityId:model.code];
    
    indexesVC.pmModel = allModel.pm25;
    indexesVC.indexesArray = allModel.indexes;
    indexesVC.realTimeModel = allModel.realtime;
    
    [self.navigationController pushViewController:indexesVC animated:YES];
}

#pragma mark 创建UICollectionView
- (void)createCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , SCREEN_HEIGHT - 40) collectionViewLayout:layout];
    _collectionView.pagingEnabled = YES;
    _collectionView.backgroundColor = [UIColor clearColor];
    // 不显示滑动的水平线
    _collectionView.showsHorizontalScrollIndicator = NO;
    // 取消弹簧效果
    _collectionView.bounces = NO;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    [_collectionView registerNib:[UINib nibWithNibName:@"WeatherCell" bundle:nil] forCellWithReuseIdentifier:[WeatherCell identifier]];
    
    [self.view addSubview:_collectionView];
    
}
#pragma mark 创建分页视图PageControl
- (void)createPageControl
{
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.numberOfPages = _delegate.cityArray.count;
    
    _pageControl.center = CGPointMake(SCREEN_WIDTH / 2.0, 15);
    _pageControl.pageIndicatorTintColor = COLOR_LIGHTGRAYCOLOR;
    [self.view addSubview:_pageControl];
}


#pragma mark - UICollectionViewDataSource & UICollectionViewDelegate
#pragma mark 项数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(_delegate.currentCityModel){
        return _delegate.cityArray.count + 1;
    }
    
    return _delegate.cityArray.count;
}
#pragma mark cell

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WeatherCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[WeatherCell identifier] forIndexPath:indexPath];
    cell.delegate = self;
    CityModel *cityModel = nil;
    
    if(_delegate.currentCityModel){
        
        if (indexPath.item == 0) {
            cityModel = _delegate.currentCityModel;
            
        }else
        {
            cityModel = _delegate.cityArray[indexPath.item - 1];
        }
        
    }else
    {
        cityModel = _delegate.cityArray[indexPath.item];

    }
    
    cell.cityModel = cityModel;
    cell.backgroundColor = [UIColor clearColor];
    cell.model = [AppDelegate findAllWeatherModelByCityId:cityModel.code];
    [cell setBackgroundImageViewWithImage:[self cellBackgroundImageWithCityModel:cityModel]];
    return cell;
}
#pragma mark cell将要出现的时候
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    for (UIView *v in cell.subviews) {
        UITableView *t = v.subviews.lastObject;
        t.contentOffset = CGPointZero;
    }
}


#pragma mark - UICollectionViewDelegateFlowLayout
#pragma mark 每一项的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 40);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.currentCityIndex = (int)(scrollView.contentOffset.x / SCREEN_WIDTH);
    
}

#pragma mark - CityManageViewController 的代理方法
#pragma mark 跳转到选中的城市
- (void)changeCurrentChooseCity:(NSInteger)cityIndex
{
    [AppDelegate parseData];
    
    // 刷新PageControl
    [self reloadPageControl];
    
    if (_delegate.currentCityModel) {
        self.currentCityIndex = (int)cityIndex + 1;
    }else
    {
        self.currentCityIndex = (int)cityIndex;
    }
    
    [_collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
    
}
#pragma mark 定位到当前城市
- (void)cityManagerVCPopToLocationCity
{
    self.currentCityIndex = 0;
}

#pragma mark - WeatherCell 的代理方法
- (void)weatherCell:(WeatherCell *)weatherCell loadDataWithCityModel:(CityModel *)cityModel
{
    [ZDMTool sendAFNetworkGet:kWeather parameters:@{@"cityIds" : cityModel.code} success:^(id responseObject) {
        [weatherCell endHeaderView];
        
        NSArray *value = responseObject[@"value"];
        NSLog(@"value -- %@",value);
        
        for (NSDictionary *cityWeather in value) {
            
            AllWeatherModel *weatherModel = [[AllWeatherModel alloc] init];
            [weatherModel setValuesForKeysWithDictionary:cityWeather];
            
            AllWeatherModel *findModel = [AppDelegate findAllWeatherModelByCityId:cityModel.code];
            if (findModel) {
                [_delegate.weatherArray removeObject:findModel];
            }
            [_delegate.weatherArray addObject:weatherModel];
        }
        
        
        [_collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
        
    } failure:^(NSError *error) {
        [weatherCell endHeaderView];
        NSLog(@"error -- %@",error.localizedDescription);
    }];
}

#pragma mark - 重写currentCityIndex的setting方法
- (void)setCurrentCityIndex:(int)currentCityIndex
{
    _currentCityIndex = currentCityIndex;
    
    if(_delegate.cityArray.count > 0)
    {
        CGPoint point = _collectionView.contentOffset;
        point.x = SCREEN_WIDTH * _currentCityIndex;
        [_collectionView setContentOffset:point];
        
        // 改变pageControl的当前页和标题
        _pageControl.currentPage = _currentCityIndex;
        [self changeBottomView];
        
    }
    
}


#pragma mark - 根据城市的天气返回图片
- (UIImage *)cellBackgroundImageWithCityModel:(CityModel *)cityModel
{
    AllWeatherModel *weatherModel = [AppDelegate findAllWeatherModelByCityId:cityModel.code];
    int weatherIndex = [[weatherModel.weathers[0] img] intValue] ;
    
    
    NSString *imageName = nil;
    
    if(weatherIndex == 0){
        
        return [UIImage sd_animatedGIFNamed:@"晴"];
    }
    else if(weatherIndex >= 1 && weatherIndex <= 2)
    {
        return [UIImage sd_animatedGIFNamed:@"云"];
        
    }else if((weatherIndex >= 3 && weatherIndex <= 12) || (weatherIndex >= 21 && weatherIndex <= 25) || weatherIndex == 19){
        return [UIImage sd_animatedGIFNamed:@"雨"];
        
    }else if((weatherIndex >= 13 && weatherIndex <= 14) || weatherIndex == 26)
    {
        return [UIImage sd_animatedGIFNamed:@"雪"];
        
    }else if((weatherIndex >= 15 && weatherIndex <= 17) || (weatherIndex >= 27 && weatherIndex <= 28))
    {
        return [UIImage sd_animatedGIFNamed:@"大雪"];
    }
    else{
        return [UIImage sd_animatedGIFNamed:@"晴"];
    }

    return [UIImage imageNamed:imageName];
}

#pragma mark - 确定PageControl的页数
- (void)reloadPageControl
{
    if (_delegate.currentCityModel) {
        _pageControl.numberOfPages = _delegate.cityArray.count + 1;
    }else
    {
        _pageControl.numberOfPages = _delegate.cityArray.count;
    }
}

#pragma mark - 确定当前城市
- (CityModel *)currentCity{
    CityModel *cityModel = nil;
    if(_delegate.currentCityModel)
    {
        if (_currentCityIndex == 0) {
            cityModel = _delegate.currentCityModel;
        }else
        {
            cityModel = _delegate.cityArray[_currentCityIndex - 1];
        }
    }else
    {
        cityModel = _delegate.cityArray[_currentCityIndex];
    }
    return cityModel;
}
#pragma mark - 改变标题
- (void)changeBottomView{
    if (_delegate.currentCityModel) {
        if (_pageControl.currentPage == 0) {
            [UIView animateWithDuration:0.5 animations:^{
//                CGFloat margin = (SCREEN_WIDTH - 30 * 3) / 4;
                
                self.cityManagerBtn.frame = CGRectMake(SCREEN_WIDTH - 50, 5, 30, 30);
                self.indexesBtn.frame = CGRectMake(20, 5, 30, 30);
                
                self.locationImageView.frame = CGRectMake(self.locationImageView.centerX - 13, 5, 26, 30);
                
            } completion:^(BOOL finished) {
                
            }];
        }else
        {
            [UIView animateWithDuration:0.5 animations:^{
                
                CGFloat margin = (SCREEN_WIDTH - 30 * 2) / 3.0;
                
                self.cityManagerBtn.frame = CGRectMake(SCREEN_WIDTH - margin - 30, 5, 30, 30);
                self.indexesBtn.frame = CGRectMake(margin, 5, 30, 30);
                self.locationImageView.frame = CGRectMake(SCREEN_WIDTH / 2 ,self.bottomView.height / 2,0,0);
            } completion:nil];
            
        }
    }else
    {
        [UIView animateWithDuration:0.5 animations:^{
            
            CGFloat margin = (SCREEN_WIDTH - 30 * 2) / 3.0;
            
            self.cityManagerBtn.frame = CGRectMake(SCREEN_WIDTH - margin - 30, 5, 30, 30);
            self.indexesBtn.frame = CGRectMake(margin, 5, 30, 30);
            self.locationImageView.frame = CGRectMake(SCREEN_WIDTH / 2 ,self.bottomView.height / 2,0,0);
        } completion:nil];
    }
}
#pragma mark - 确定白天还是晚上
- (BOOL)nowForTheNightWithAllWeatherModel:(AllWeatherModel *)allWeatherModel
{
    RealTimeModel *realTimeModel = allWeatherModel.realtime;
    OneDayModel *oneDayModel = [allWeatherModel.weathers firstObject];
    // 确定白天还是晚上
    NSString *nowDateStr = [self subTimeWithDate:realTimeModel.time];
    CGFloat nowTime = [self dateStringToDateFloat:nowDateStr];
    CGFloat sunRiseTime = [self dateStringToDateFloat:oneDayModel.sun_rise_time];
    CGFloat sunDownTime = [self dateStringToDateFloat:oneDayModel.sun_down_time];
    if (nowTime >= sunRiseTime && nowTime < sunDownTime) {
        return NO;
    }
    
    return YES;
}
#pragma mark 截取时间
- (NSString *)subTimeWithDate:(NSString *)date
{
    NSRange range = [date rangeOfString:@" "];
    return [date substringWithRange:NSMakeRange(range.location + 1, 5)];
}
#pragma mark 转换时间
- (CGFloat)dateStringToDateFloat:(NSString *)dateStr
{
    CGFloat hour = [[dateStr substringToIndex:2] floatValue];
    CGFloat min = [[dateStr substringFromIndex:3] floatValue];
    
    return hour * 60 + min;
}

@end
