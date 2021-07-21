//
//  ViewController.m
//  Example
//
//  Created by gaokun on 2021/1/14.
//

#import "ViewController.h"
#import <JXCategoryViewExt/JXCategoryView.h>
#import "ListViewController.h"

#define HasAFNetworking (__has_include(<AFNetworking/AFNetworking.h>) || __has_include("AFNetworking.h"))

@interface ViewController ()<JXCategoryListContainerViewDelegate, JXCategoryViewDelegate, JXCategoryTitleViewDataSource>

@property (nonatomic, strong) JXCategoryTitleView *titleView;

@property (nonatomic, strong) JXCategoryDotZoomView   *dotView;

@property (nonatomic, strong) JXCategoryListContainerView *containerView;

@property (nonatomic, strong) NSArray *titles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.titleView.frame = CGRectMake(0, 100, self.view.bounds.size.width, 40);
    self.dotView.frame = CGRectMake(0, 140, self.view.bounds.size.width, 40);
    self.containerView.frame = CGRectMake(0, 180, self.view.bounds.size.width, self.view.bounds.size.height - 180);
    
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.dotView];
    [self.view addSubview:self.containerView];
}

#pragma mark - JXCategoryTitleViewDataSource
- (NSInteger)numberOfTitleView:(JXCategoryTitleView *)titleView {
    return self.titles.count;
}

- (NSString *)titleView:(JXCategoryTitleView *)titleView titleForIndex:(NSInteger)index {
    return self.titles[index];
}

#pragma mark - JXCategoryListContainerViewDelegate
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titles.count;
}

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    ListViewController *listVC = [ListViewController new];
    return listVC;
}

#pragma mark - JXCategoryViewDelegate
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%zd", index);
}

- (JXCategoryTitleView *)titleView {
    if (!_titleView) {
        _titleView = [[JXCategoryTitleView alloc] init];
//        _titleView.cellBackgroundSelectedColor = UIColor.grayColor;
//        _titleView.cellBackgroundUnselectedColor = UIColor.blueColor;
//        _titleView.cellBackgroundColorGradientEnabled = YES;
        
//        _titleView.titleFont = [UIFont systemFontOfSize:15];
//        _titleView.titleSelectedFont = [UIFont boldSystemFontOfSize:18];
//        _titleView.titleLabelZoomEnabled = YES;
//        _titleView.titleLabelZoomEndUseSelectedFontEnabled = YES;
        
        _titleView.titleFont = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _titleView.titleSelectedFont = [UIFont fontWithName:@"PingFangSC-Medium" size:20];
        _titleView.titleLabelZoomEnabled = YES;
        _titleView.titleLabelZoomScale = 1.25;
        _titleView.titleLabelZoomEndUseSelectedFontEnabled = YES;
        
        _titleView.titleDataSource = self;
//        _titleView.titles = @[@"你的", @"我的", @"他的", @"你的", @"我的", @"他的", @"你的", @"我的", @"他的"];
//        _titleView.selectItemOnScrollHalf = YES;
//        _titleView.delegate = self;
        _titleView.selectedAnimationEnabled = YES;
        
//        JXCategoryIndicatorBackgroundView *indicator = [JXCategoryIndicatorBackgroundView new];
//        indicator.indicatorCornerRadius = 4;
//        indicator.indicatorWidthIncrement = 20;
//        _titleView.indicators = @[indicator];
        
        _titleView.listContainer = self.containerView;
    }
    return _titleView;
}

- (JXCategoryDotZoomView *)dotView {
    if (!_dotView) {
        _dotView = [[JXCategoryDotZoomView alloc] init];
        _dotView.titles = @[@"你好", @"我好", @"他好", @"你好", @"我好", @"他好", @"你好", @"我好", @"他好"];
        
        _dotView.titleFont = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _dotView.titleSelectedFont = [UIFont fontWithName:@"PingFangSC-Medium" size:20];
        _dotView.titleLabelZoomEnabled = YES;
        _dotView.titleLabelZoomScale = 1.25;
//        _dotView.titleLabelZoomEndUseSelectedFontEnabled = YES;
//        _dotView.dotOffset = CGPointMake(5, 0);
//        _dotView.dotStyle = JXCategoryDotStyle_Hollow;
        
        _dotView.listContainer = self.containerView;
    }
    return _dotView;
}

- (JXCategoryListContainerView *)containerView {
    if (!_containerView) {
        _containerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_CollectionView delegate:self];
    }
    return _containerView;
}

- (NSArray *)titles {
    return @[@"你的", @"我的", @"他的", @"你的", @"我的", @"他的", @"你的", @"我的", @"他的"];
}

@end
