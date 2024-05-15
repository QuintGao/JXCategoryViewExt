//
//  JXCategoryBadgeCell.h
//  JXCategoryViewExt
//
//  Created by QuintGao on 2022/4/19.
//

#import "JXCategoryTitleCell.h"
#import "JXCategoryBadgeCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryBadgeItemView : UIView

@property (nonatomic, strong, readonly) UILabel *badgeLabel;

@property (nonatomic, strong, readonly) UIImageView *badgeImageView;

@property (nonatomic, assign) JXCategoryBadgeCellModel *cellModel;

- (void)clear;

@end

@interface JXCategoryBadgeCell : JXCategoryTitleCell

@property (nonatomic, strong) JXCategoryBadgeItemView *badgeItemView;

@end

NS_ASSUME_NONNULL_END
