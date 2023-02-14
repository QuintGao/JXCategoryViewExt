//
//  JXCategoryTitleBackgroundImageView.m
//  Example
//
//  Created by QuintGao on 2023/2/13.
//

#import "JXCategoryTitleBackgroundImageView.h"
#import "JXCategoryTitleBackgroundImageCell.h"
#import "JXCategoryTitleBackgroundImageCellModel.h"

@implementation JXCategoryTitleBackgroundImageView

- (void)dealloc {
    self.loadImageBlock = nil;
}

- (void)initializeData {
    [super initializeData];
    
    _imageSize = CGSizeMake(100, 100);
    _imageZoomEnabled = NO;
    _imageZoomScale = 1;
}

- (Class)preferredCellClass {
    return JXCategoryTitleBackgroundImageCell.class;
}

- (void)refreshDataSource {
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:self.titles.count];
    for (int i = 0; i < self.titles.count; i++) {
        JXCategoryTitleBackgroundImageCellModel *cellModel = [[JXCategoryTitleBackgroundImageCellModel alloc] init];
        [tempArray addObject:cellModel];
    }
    self.dataSource = [NSArray arrayWithArray:tempArray];
}

- (void)refreshCellModel:(JXCategoryBaseCellModel *)cellModel index:(NSInteger)index {
    [super refreshCellModel:cellModel index:index];
    
    JXCategoryTitleBackgroundImageCellModel *myCellModel = (JXCategoryTitleBackgroundImageCellModel *)cellModel;
    myCellModel.loadImageBlock = self.loadImageBlock;
    myCellModel.imageSize = self.imageSize;
    if (self.bgImageInfoArray && self.bgImageInfoArray.count != 0) {
        myCellModel.bgImageInfo = self.bgImageInfoArray[index];
    }
    if (self.selectedBgImageInfoArray && self.selectedBgImageInfoArray.count != 0) {
        myCellModel.selectedBgImageInfo = self.selectedBgImageInfoArray[index];
    }
    myCellModel.imageZoomEnabled = self.imageZoomEnabled;
    myCellModel.imageZoomScale = ((index == self.selectedIndex) ? self.imageZoomScale : 1.0);
}

- (void)refreshSelectedCellModel:(JXCategoryBaseCellModel *)selectedCellModel unselectedCellModel:(JXCategoryBaseCellModel *)unselectedCellModel {
    [super refreshSelectedCellModel:selectedCellModel unselectedCellModel:unselectedCellModel];
    
    JXCategoryTitleBackgroundImageCellModel *mySelectedCellModel = (JXCategoryTitleBackgroundImageCellModel *)selectedCellModel;
    mySelectedCellModel.imageZoomScale = self.imageZoomScale;
}

- (void)refreshLeftCellModel:(JXCategoryBaseCellModel *)leftCellModel rightCellModel:(JXCategoryBaseCellModel *)rightCellModel ratio:(CGFloat)ratio {
    [super refreshLeftCellModel:leftCellModel rightCellModel:rightCellModel ratio:ratio];
    
    JXCategoryTitleBackgroundImageCellModel *leftModel = (JXCategoryTitleBackgroundImageCellModel *)leftCellModel;
    JXCategoryTitleBackgroundImageCellModel *rightModel = (JXCategoryTitleBackgroundImageCellModel *)rightCellModel;
    if (self.isImageZoomEnabled) {
        leftModel.imageZoomScale = [JXCategoryFactory interpolationFrom:self.imageZoomScale to:1.0 percent:ratio];
        rightModel.imageZoomScale = [JXCategoryFactory interpolationFrom:1.0 to:self.imageZoomScale percent:ratio];
    }
}

@end
