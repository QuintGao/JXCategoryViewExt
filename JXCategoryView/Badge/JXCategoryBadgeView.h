//
//  JXCategoryBadgeView.h
//  JXCategoryViewExt
//
//  Created by QuintGao on 2022/4/19.
//

#import "JXCategoryTitleView.h"
#import "JXCategoryBadgeCell.h"
#import "JXCategoryBadgeCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryBadgeView : JXCategoryTitleView

// badge类型数组，默认[JXCategoryBadgeType_Number,...]
@property (nonatomic, strong) NSArray<NSNumber *> *badgeTypes;

// 需要与titles的count对应，可根据对应的类型传入NSString或NSNumber
// 对于JXCategoryBadgeType_Dot，1代表显示 0代表隐藏
@property (nonatomic, strong) NSArray<id> *badges;

// 内部默认不会格式化数字，直接转成字符串显示。比如业务需要数字超过99显示99+，可以通过该block实现
@property (nonatomic, copy, nullable) NSString *(^badgeStringFormatterBlock)(JXCategoryBadgeType badgeType, id badge);

// 自定义单个item的样式
@property (nonatomic, copy, nullable) void(^badgeStyleBlock)(NSInteger index ,UILabel *badgeLabel);

// badgeLabel的font，默认：[UIFont systemFontOfSize:11]
@property (nonatomic, strong) UIFont *badgeLabelFont;

// 数字的背景色，默认：[UIColor redColor]
@property (nonatomic, strong) UIColor *badgeBackgroundColor;

// 数字的title颜色，默认：[UIColor whiteColor]
@property (nonatomic, strong) UIColor *badgeTitleColor;

// badgeLabel的宽度补偿，label真实的宽度是文字内容的宽度+补偿的宽度，默认：10
@property (nonatomic, assign) CGFloat badgeLabelWithIncrement;

// badgeLabel的高度，默认：14
@property (nonatomic, assign) CGFloat badgeLabelHeight;

// badgeLabel x,y方向的偏移（+值：水平方向向右，竖直方向向下）
@property (nonatomic, assign) CGPoint badgeLabelOffset;

/**
当是单一数字时，是否让numberLabel变成圆。即numberLabel的宽度等于高度，cornerRadius等于高度/2。当为true，单一数字时会忽略numberLabelWidthIncrement属性。默认为NO；
*/
@property (nonatomic, assign) BOOL shouldMakeRoundWhenSingleNumber;

// 以下属性对 JXCategoryBadgeType_Dot 类型有效
// 红点的尺寸。默认：CGSizeMake(10, 10)
@property (nonatomic, assign) CGSize dotBadgeSize;
//红点的圆角值。默认：JXCategoryViewAutomaticDimension（self.dotBadge.height/2）
@property (nonatomic, assign) CGFloat dotBadgeCornerRadius;
/**
 红点  x,y方向的偏移 （+值：水平方向向右，竖直方向向下）
 */
@property (nonatomic, assign) CGPoint dotBadgeOffset;

@end

NS_ASSUME_NONNULL_END
