//
//  JXCategoryTitleBackgroundImageCellModel.h
//  Example
//
//  Created by QuintGao on 2023/2/13.
//

#import <JXCategoryViewExt/JXCategoryView.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryTitleBackgroundImageCellModel : JXCategoryTitleCellModel

@property (nonatomic, strong) id bgImageInfo;
@property (nonatomic, strong) id selectedBgImageInfo;
@property (nonatomic, copy) void(^loadImageBlock)(UIImageView *imageView, id info);
@property (nonatomic, assign) CGSize imageSize; // 默认CGSizeMake(100, 100)
@property (nonatomic, assign, getter=isImageZoomEnabled) BOOL imageZoomEnabled;
@property (nonatomic, assign) CGFloat imageZoomScale;

@end

NS_ASSUME_NONNULL_END
