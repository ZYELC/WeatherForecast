//
//  IndexesViewController.m
//  WeatherForecast
//
//  Created by qianfeng on 14/5/14.
//  Copyright © 2014年 zhangying. All rights reserved.
//

#import "IndexesViewController.h"
#import "IndexesModel.h"
#import "CityModel.h"
#import "Pm25View.h"
#import "RealTimeModel.h"
#import "IndexesCollectionViewCell.h"
#import "UMSocial.h"



#define IndexesColor COLOR_RGB(245,245,245)

@interface IndexesViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIScrollView *scollView;

@property (nonatomic, strong) Pm25View *pm25View;

/**
 *  体感温度
 */
@property (nonatomic, strong) UILabel  *sendibleTempLabel;
/**
 *  湿度
 */
@property (nonatomic, strong) UILabel  *shiduLabel;
/**
 *  风
 */
@property (nonatomic, strong) UILabel  *windLabel;
/**
 *  天气
 */
@property (nonatomic, strong) UILabel *weatherLabel;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation IndexesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    
    self.view.backgroundColor = IndexesColor;
    self.navigationItem.title = @"空气质量";

    self.automaticallyAdjustsScrollViewInsets = NO;
    

    [self createBottomBtn];
    [self createScrollView];
    [self createPm25View];
    [self createOthersInfo];
    [self createCollectionView];
}
// 返回
//返回
- (void)popViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 分享
- (void)shareWeather{
    [UMSocialSnsService presentSnsIconSheetView:self appKey:@"54dda2f6fd98c5ec680008aa" shareText:@"" shareImage:[self captureScrollView] shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,nil] delegate:nil];
}

#pragma mark 对当前视图进行截屏
- (UIImage *)captureScrollView {
    UIImage* image = nil;
    UIGraphicsBeginImageContext(_scollView.contentSize);
    {
        CGPoint savedContentOffset = _scollView.contentOffset;
        CGRect savedFrame = _scollView.frame;
        _scollView.contentOffset = CGPointZero;
        _scollView.frame = CGRectMake(0, 0, _scollView.contentSize.width, _scollView.contentSize.height);
        
        [_scollView.layer renderInContext: UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
        
        _scollView.contentOffset = savedContentOffset;
        _scollView.frame = savedFrame;
    }
    UIGraphicsEndImageContext();
    
    if (image != nil) {
        return image;
    }
    return nil;
}
#pragma mark - 创建UIBarButtonItem
- (void)createBottomBtn{
    [self addPopBtn];
    
    UIButton *shareBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 5, 30, 30)];
    shareBtn.tintColor = [UIColor grayColor];
    UIImage *shareImage = [[UIImage imageNamed:@"share"]imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [shareBtn setBackgroundImage:shareImage forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareWeather) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:shareBtn];
    
}
#pragma mark - 创建ScrollView
- (void)createScrollView{
    
    _scollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , SCREEN_HEIGHT - 40)];
    
    _scollView.showsVerticalScrollIndicator = NO;
    _scollView.backgroundColor = IndexesColor;
    [self.view addSubview:_scollView];
}

#pragma mark - 创建空气质量指数的View
- (void)createPm25View
{
    _pm25View = [[Pm25View alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 400)];
    _pm25View.backgroundColor = IndexesColor;
    _pm25View.cityName = _cityModel.name;
    if (_pmModel) {
        _pm25View.pm25Model = _pmModel;
    }
    [_scollView addSubview:_pm25View];
}
#pragma mark -
- (void)createOthersInfo{
    NSArray *titles = @[@"天气情况",@"体感温度",@"湿度指数",@"风向风力"];
    CGFloat viewWidth = 45;
    CGFloat margin = ( SCREEN_WIDTH - (4 * viewWidth) ) / 5.0;
    for (int i = 0; i < titles.count; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(margin + (i * (viewWidth + margin)), _pm25View.maxY + 10 , viewWidth, 100)];
        
        NSString *imageName = [NSString stringWithFormat:@"other-%d",i];
        UIImageView *imageView = [UIImageView createImageViewWithFrame:CGRectMake(0, 0, viewWidth, viewWidth) image:[UIImage imageNamed:imageName]];
        
        [view addSubview:imageView];
        
        UILabel *titleLabel = [UILabel labelWithFrame:CGRectMake(0, imageView.maxY , viewWidth, 20) text:titles[i] font:FONT(18) textColor:[UIColor grayColor]];
        titleLabel.adjustsFontSizeToFitWidth = YES;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [view addSubview:titleLabel];
        
        UILabel *infoLabel = [UILabel labelWithFrame:CGRectMake(0, titleLabel.maxY + 10, viewWidth, 20) text:@"N/A" font:FONT(18) textColor:COLOR_BLACKCOLOR];
        infoLabel.textAlignment = NSTextAlignmentCenter;
        infoLabel.adjustsFontSizeToFitWidth = YES;
        infoLabel.numberOfLines = 2;
        [view addSubview:infoLabel];
        
        
        
        switch (i) {
            case 0:
                _weatherLabel = infoLabel;
                break;
            case 1:
                _sendibleTempLabel = infoLabel;
                break;
            case 2:
                _shiduLabel = infoLabel;
                break;
            case 3:
                _windLabel = infoLabel;
                break;
            default:
                break;
        }
        
        if(_realTimeModel){
            _weatherLabel.text = _realTimeModel.weather;
            _sendibleTempLabel.text = [NSString stringWithFormat:@"%@℃",_realTimeModel.sendibleTemp];
            _shiduLabel.text = [NSString stringWithFormat:@"%@％",_realTimeModel.sD];
            _windLabel.text = [NSString stringWithFormat:@"%@%@",_realTimeModel.wD,_realTimeModel.wS];
        }
        
        [_scollView addSubview:view];
    }
}

#pragma mark - 创建显示指数的UICollectionView
- (void)createCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 10;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, _pm25View.maxY + 120, SCREEN_WIDTH - 20, 100 ) collectionViewLayout:layout];
    _collectionView.backgroundColor = IndexesColor;
    
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_scollView addSubview:_collectionView];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"IndexesCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:[IndexesCollectionViewCell identifier]];
    
    // 指数描述
    _contentLabel = [ZDMView createLabelWithFrame:CGRectMake(10, _collectionView.maxY, SCREEN_WIDTH - 20, 44) text:@"指数描述——点击相应指数显示信息" font:FONT(15) textColor:[UIColor blackColor]];
    _contentLabel.numberOfLines = 0;
    _contentLabel.adjustsFontSizeToFitWidth = YES;
    _contentLabel.textAlignment = NSTextAlignmentCenter;
    [_scollView addSubview:_contentLabel];
    
    _scollView.contentSize = CGSizeMake(SCREEN_WIDTH, _contentLabel.maxY);
}

#pragma mark - UICollectionView 的代理和数据源
#pragma mark - 项数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _indexesArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    IndexesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[IndexesCollectionViewCell identifier] forIndexPath:indexPath];
    
    cell.indexPath = indexPath;
    IndexesModel *model = _indexesArray[indexPath.item];
    cell.title.text = model.name;
    [cell.level setTitle:model.level forState:UIControlStateNormal];
    cell.cellBlock = ^(NSIndexPath *indexPath){
        NSLog(@"点击了 -- %@",[_indexesArray[indexPath.item] name]);
        _contentLabel.text = [NSString stringWithFormat:@"%@--%@",[_indexesArray[indexPath.item] name],[_indexesArray[indexPath.item] content]];
    };
    
    return cell;
}

#pragma mark - UICollectionViewFlowLayout 的代理
#pragma mark item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(44, 80);
}
#pragma mark 内边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 0, 10, 0);
}
@end
