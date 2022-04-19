//
//  JXCategoryBadgeCellModel.h
//  JXCategoryViewExt
//
//  Created by QuintGao on 2022/4/19.
//

#import "JXCategoryTitleCellModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JXCategoryBadgeType) {
    JXCategoryBadgeType_Number, // 数字
    JXCategoryBadgeType_Text,   // 文字
    JXCategoryBadgeType_Dot,    // 圆点
};

@interface JXCategoryBadgeCellModel : JXCategoryTitleCellModel

@property (nonatomic, assign) JXCategoryBadgeType badgeType;
@property (nonatomic, strong) id badge;

// 自定义单个item的样式
@property (nonatomic, copy) void(^badgeStyleBlock)(NSInteger index ,UILabel *badgeLabel);

@property (nonatomic, copy) NSString *badgeString;
@property (nonatomic, assign, readonly) CGFloat badgeStringWidth;
@property (nonatomic, strong) UIColor *badgeBackgroundColor;
@property (nonatomic, strong) UIColor *badgeTitleColor;
@property (nonatomic, assign) CGFloat badgeLabelWidthIncrement;
@property (nonatomic, assign) CGFloat badgeLabelHeight;
@property (nonatomic, strong) UIFont *badgeLabelFont;
@property (nonatomic, assign) CGPoint badgeLabelOffset;
@property (nonatomic, assign) BOOL shouldMakeRoundWhenSingleNumber;

// JXCategoryBadgeType_Dot有效
@property (nonatomic, assign) CGSize dotBadgeSize;
@property (nonatomic, assign) CGFloat dotBadgeCornerRadius;
@property (nonatomic, assign) CGPoint dotBadgeOffset;

@end

NS_ASSUME_NONNULL_END
