//
//  JXCategoryDotZoomCellModel.h
//  Example
//
//  Created by gaokun on 2021/1/18.
//

#import "JXCategoryTitleCellModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JXCategoryDotStyle) {
    JXCategoryDotStyle_Solid = 0,   // 实心
    JXCategoryDotStyle_Hollow       // 空心
};

@interface JXCategoryDotZoomCellModel : JXCategoryTitleCellModel

@property (nonatomic, assign) JXCategoryDotStyle dotStyle;
@property (nonatomic, assign) CGFloat dotWH;
@property (nonatomic, assign) CGFloat hollowWH;
@property (nonatomic, strong) UIColor *dotColor;
@property (nonatomic, assign) CGPoint dotOffset;
@property (nonatomic, assign) CGFloat ratio;

@end

NS_ASSUME_NONNULL_END
