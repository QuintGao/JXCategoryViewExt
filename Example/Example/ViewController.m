//
//  ViewController.m
//  Example
//
//  Created by gaokun on 2021/1/14.
//

#import "ViewController.h"
#import <JXCategoryViewExt/JXCategoryView.h>
#import "ListViewController.h"
#import <SDWebImage/SDWebImage.h>

#define HasAFNetworking (__has_include(<AFNetworking/AFNetworking.h>) || __has_include("AFNetworking.h"))
// 颜色
#define GKColorRGBA(r, g, b, a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]
#define GKColorRGB(r, g, b)     GKColorRGBA(r, g, b, 1.0)

@interface ViewController ()<JXCategoryListContainerViewDelegate, JXCategoryViewDelegate, JXCategoryTitleViewDataSource>

@property (nonatomic, strong) JXCategoryTitleView *titleView;

@property (nonatomic, strong) JXCategoryDotZoomView   *dotView;

@property (nonatomic, strong) JXCategorySubTitleImageView *subTitleView;

@property (nonatomic, strong) JXCategoryListContainerView *containerView;

@property (nonatomic, strong) NSArray *titles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.titleView.frame = CGRectMake(0, 100, self.view.bounds.size.width, 40);
    self.dotView.frame = CGRectMake(0, 140, self.view.bounds.size.width, 40);
    self.subTitleView.frame = CGRectMake(0, 180, self.view.bounds.size.width, 54);
    self.containerView.frame = CGRectMake(0, 240, self.view.bounds.size.width, self.view.bounds.size.height - 240);
    
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.dotView];
    [self.view addSubview:self.subTitleView];
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

#pragma mark - Private
- (UIImage *)changeImageWithImage:(UIImage *)image color:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, image.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextClipToMask(context, rect, image.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

#pragma mark - 懒加载
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
        _titleView.titleLabelVerticalOffset = -10;
        _titleView.backgroundColor = UIColor.grayColor;
        
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

- (JXCategorySubTitleImageView *)subTitleView {
    if (!_subTitleView) {
        _subTitleView = [[JXCategorySubTitleImageView alloc] init];
        _subTitleView.titles = @[@"热点", @"种草", @"本地", @"放映厅", @"直播"];
        _subTitleView.subTitles = @[@"热点资讯", @"潮流好物", @"同城关注", @"宅家必看", @"大V在线"];
        _subTitleView.titleFont = [UIFont boldSystemFontOfSize:15];
        _subTitleView.titleSelectedFont = [UIFont boldSystemFontOfSize:15];
        _subTitleView.titleColor = UIColor.blackColor;
        _subTitleView.titleSelectedColor = GKColorRGB(243, 136, 68);
        _subTitleView.titleLabelVerticalOffset = -10;
        _subTitleView.subTitleFont = [UIFont systemFontOfSize:11];
        _subTitleView.subTitleSelectedFont = [UIFont systemFontOfSize:11];
        _subTitleView.subTitleColor = [UIColor grayColor];
        _subTitleView.subTitleSelectedColor = [UIColor whiteColor];
        _subTitleView.subTitleWithTitlePositionMargin = 3;
        _subTitleView.cellSpacing = 0;
        _subTitleView.cellWidthIncrement = 16;
//        _subTitleView.imageViewClass = [SDAnimatedImageView class];
        _subTitleView.imageSize = CGSizeMake(12, 12);
        _subTitleView.imageTypes = @[@(JXCategorySubTitleImageType_None), @(JXCategorySubTitleImageType_Left), @(JXCategorySubTitleImageType_None), @(JXCategorySubTitleImageType_Left), @(JXCategorySubTitleImageType_Left)];
        _subTitleView.imageInfoArray = @[@"", @"zhongcao", @"", @"fangying", @"gif"];
        _subTitleView.selectedImageInfoArray = @[@"", @"zhongcao", @"", @"fangying", @"gif"];
        _subTitleView.subTitleInCenterX = NO;
        
        __weak __typeof(self) weakSelf = self;
        _subTitleView.loadImageBlock = ^(UIImageView *imageView, id info) {
            __strong __typeof(weakSelf) self = weakSelf;
            NSString *name = (NSString *)info;
            if (name.length > 0) {
                if ([name isEqualToString:@"gif"]) {
//                    [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://upload-images.jianshu.io/upload_images/1598505-b6817cad3c9fa37c.gif?imageMogr2/auto-orient/strip"]];
                    NSMutableArray *images = [NSMutableArray new];
                    for (NSInteger i = 0; i < 4; i++) {
                        NSString *imageName = [NSString stringWithFormat:@"cm2_list_icn_loading%zd", i + 1];

                        UIImage *img = [self changeImageWithImage:[UIImage imageNamed:imageName] color:UIColor.redColor];

                        [images addObject:img];
                    }

                    for (NSInteger i = 4; i > 0; i--) {
                        NSString *imageName = [NSString stringWithFormat:@"cm2_list_icn_loading%zd", i];

                        UIImage *img = [self changeImageWithImage:[UIImage imageNamed:imageName] color:UIColor.redColor];

                        [images addObject:img];
                    }

                    imageView.animationImages = images;
                    imageView.animationDuration = 0.75;
                    [imageView startAnimating];
                }else {
                    imageView.image = [UIImage imageNamed:name];
                }
            }
        };
        _subTitleView.ignoreImageWidth = YES;
//        _subTitleView.indicators = @[self.lineView];
        _subTitleView.listContainer = self.containerView;
        
        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
        lineView.indicatorHeight = 16;
        lineView.verticalMargin = 10;
        lineView.indicatorWidthIncrement = 0;
        lineView.lineScrollOffsetX = _subTitleView.titleImageSpacing + _subTitleView.imageSize.width;
        lineView.indicatorColor = GKColorRGB(243, 136, 68);;
        lineView.lineStyle = JXCategoryIndicatorLineStyle_Lengthen;
        _subTitleView.indicators = @[lineView];
    }
    return _subTitleView;
}

- (JXCategoryDotZoomView *)dotView {
    if (!_dotView) {
        _dotView = [[JXCategoryDotZoomView alloc] init];
        _dotView.titles = @[@"你好", @"我好", @"他好", @"你好", @"我好"];
        
        _dotView.titleFont = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _dotView.titleSelectedFont = [UIFont fontWithName:@"PingFangSC-Medium" size:20];
        _dotView.titleLabelZoomEnabled = YES;
        _dotView.titleLabelZoomScale = 1.25;
        _dotView.titleLabelZoomEndUseSelectedFontEnabled = YES;
        _dotView.dotOffset = CGPointMake(3, 3);
        _dotView.dotStyle = JXCategoryDotStyle_Hollow;
        _dotView.hollowWH = 6.0f;
        
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
    return @[@"你的", @"我的", @"他的", @"你的", @"我的"];
}

@end
