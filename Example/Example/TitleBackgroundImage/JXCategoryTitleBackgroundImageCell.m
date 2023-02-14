//
//  JXCategoryTitleBackgroundImageCell.m
//  Example
//
//  Created by QuintGao on 2023/2/13.
//

#import "JXCategoryTitleBackgroundImageCell.h"
#import "JXCategoryTitleBackgroundImageCellModel.h"

@interface JXCategoryTitleBackgroundImageCell()

@property (nonatomic, strong) id currentBgImageInfo;
@property (nonatomic, strong) NSLayoutConstraint *imageViewWidthConstraint;
@property (nonatomic, strong) NSLayoutConstraint *imageViewHeightConstraint;

@end

@implementation JXCategoryTitleBackgroundImageCell

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.currentBgImageInfo = nil;
}

- (void)initializeViews {
    [super initializeViews];
    
    _bgImageView = [[UIImageView alloc] init];
    self.bgImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.bgImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView insertSubview:self.bgImageView atIndex:0];
    self.imageViewWidthConstraint = [self.bgImageView.widthAnchor constraintEqualToConstant:0];
    self.imageViewWidthConstraint.active = YES;
    self.imageViewHeightConstraint = [self.bgImageView.heightAnchor constraintEqualToConstant:0];
    self.imageViewHeightConstraint.active = YES;
    [self.bgImageView.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor constant:0].active = YES;
    [self.bgImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor constant:0].active = YES;
}

- (void)reloadData:(JXCategoryBaseCellModel *)cellModel {
    [super reloadData:cellModel];
    
    JXCategoryTitleBackgroundImageCellModel *myCellModel = (JXCategoryTitleBackgroundImageCellModel *)cellModel;
    self.imageViewWidthConstraint.constant = myCellModel.imageSize.width;
    self.imageViewHeightConstraint.constant = myCellModel.imageSize.height;
    
    //因为`- (void)reloadData:(JXCategoryBaseCellModel *)cellModel`方法会回调多次，尤其是左右滚动的时候会调用无数次，如果每次都触发图片加载，会非常消耗性能。所以只会在图片发生了变化的时候，才进行图片加载。
    if (myCellModel.loadImageBlock != nil) {
        id currentImageInfo = myCellModel.bgImageInfo;
        if (myCellModel.isSelected) {
            currentImageInfo = myCellModel.selectedBgImageInfo;
        }
        
        if (currentImageInfo && ![currentImageInfo isEqual:self.currentBgImageInfo]) {
            self.currentBgImageInfo = currentImageInfo;
            !myCellModel.loadImageBlock ?: myCellModel.loadImageBlock(self.bgImageView, currentImageInfo);
        }
    }
    
    if (myCellModel.isImageZoomEnabled) {
        self.bgImageView.transform = CGAffineTransformMakeScale(myCellModel.imageZoomScale, myCellModel.imageZoomScale);
    }else {
        self.bgImageView.transform = CGAffineTransformIdentity;
    }
    
    
}

@end
