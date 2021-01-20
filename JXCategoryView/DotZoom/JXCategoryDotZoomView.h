//
//  JXCategoryDotZoomView.h
//  Example
//
//  Created by gaokun on 2021/1/18.
//

#import "JXCategoryTitleView.h"
#import "JXCategoryDotZoomCellModel.h"
#import "JXCategoryDotZoomCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryDotZoomView : JXCategoryTitleView

@property (nonatomic, assign) JXCategoryDotStyle dotStyle;

//红点的宽高。默认：10
@property (nonatomic, assign) CGFloat dotWH;

//红点的颜色。默认：[UIColor redColor]
@property (nonatomic, strong) UIColor *dotColor;
/**
 红点  x,y方向的偏移 （+值：水平方向向右，竖直方向向下）
 */
@property (nonatomic, assign) CGPoint dotOffset;

// 空心的宽高。默认：5，注意在dotStyle为JXCategoryDotStyle_Hollow时有效
@property (nonatomic, assign) CGFloat hollowWH;

@end

NS_ASSUME_NONNULL_END
