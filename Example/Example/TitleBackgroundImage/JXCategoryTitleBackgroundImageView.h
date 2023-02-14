//
//  JXCategoryTitleBackgroundImageView.h
//  Example
//
//  Created by QuintGao on 2023/2/13.
//

#import <JXCategoryViewExt/JXCategoryView.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryTitleBackgroundImageView : JXCategoryTitleView

//imageInfo数组可以传入imageName字符串或者image的URL地址等，然后会通过loadImageBlock透传回来，把imageView对于图片的加载过程完全交给使用者决定。
@property (nonatomic, strong) NSArray <id> *bgImageInfoArray;
@property (nonatomic, strong) NSArray <id> *selectedBgImageInfoArray;
@property (nonatomic, copy, nullable) void(^loadImageBlock)(UIImageView *imageView, id info);
//图片尺寸。默认CGSizeMake(20, 20)
@property (nonatomic, assign) CGSize imageSize;
//图片是否缩放。默认为NO
@property (nonatomic, assign, getter=isImageZoomEnabled) BOOL imageZoomEnabled;
//图片缩放的最大scale。默认1.2，imageZoomEnabled为YES才生效
@property (nonatomic, assign) CGFloat imageZoomScale;

@end

NS_ASSUME_NONNULL_END
