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
    myCellModel.bgImageNormalZoomScale = 1.0;
    myCellModel.bgImageSelectedZoomScale = self.imageZoomScale;
    if (index == self.selectedIndex) {
        myCellModel.bgImageCurrentZoomScale = myCellModel.bgImageSelectedZoomScale;
    }else {
        myCellModel.bgImageCurrentZoomScale = myCellModel.bgImageNormalZoomScale;
    }
}

- (void)refreshSelectedCellModel:(JXCategoryBaseCellModel *)selectedCellModel unselectedCellModel:(JXCategoryBaseCellModel *)unselectedCellModel {
    [super refreshSelectedCellModel:selectedCellModel unselectedCellModel:unselectedCellModel];
    
    JXCategoryTitleBackgroundImageCellModel *myUnselectedCellModel = (JXCategoryTitleBackgroundImageCellModel *)unselectedCellModel;
    JXCategoryTitleBackgroundImageCellModel *myselectedCellModel = (JXCategoryTitleBackgroundImageCellModel *)selectedCellModel;
    if (self.isSelectedAnimationEnabled && (selectedCellModel.selectedType == JXCategoryCellSelectedTypeClick || selectedCellModel.selectedType == JXCategoryCellSelectedTypeCode)) {
        //开启了动画过渡，且cell在屏幕内，current的属性值会在cell里面进行动画插值更新
        //1、当unselectedCell在屏幕外的时候，还是需要在这里更新值
        //2、当selectedCell在屏幕外的时候，还是需要在这里更新值（比如调用selectItemAtIndex方法选中的时候）
        BOOL isUnselectedCellVisible = NO;
        BOOL isSelectedCellVisible = NO;
        NSArray *indexPaths = [self.collectionView indexPathsForVisibleItems];
        for (NSIndexPath *indexPath in indexPaths) {
            if (indexPath.item == myUnselectedCellModel.index) {
                isUnselectedCellVisible = YES;
                continue;
            } else if (indexPath.item == myselectedCellModel.index) {
                isSelectedCellVisible = YES;
                continue;
            }
        }
        if (!isUnselectedCellVisible) {
            //但是当unselectedCell在屏幕外时，不会在cell里面通过动画插值更新，在这里直接更新
            myUnselectedCellModel.bgImageCurrentZoomScale = myUnselectedCellModel.bgImageNormalZoomScale;
        }
        if (!isSelectedCellVisible) {
            //但是当selectedCell在屏幕外时，不会在cell里面通过动画插值更新，在这里直接更新
            myselectedCellModel.bgImageCurrentZoomScale = myselectedCellModel.bgImageSelectedZoomScale;
        }
    } else {
        //没有开启动画，可以直接更新属性
        myselectedCellModel.bgImageCurrentZoomScale = myselectedCellModel.bgImageSelectedZoomScale;
        myUnselectedCellModel.bgImageCurrentZoomScale = myUnselectedCellModel.bgImageNormalZoomScale;
    }
}

- (void)refreshLeftCellModel:(JXCategoryBaseCellModel *)leftCellModel rightCellModel:(JXCategoryBaseCellModel *)rightCellModel ratio:(CGFloat)ratio {
    [super refreshLeftCellModel:leftCellModel rightCellModel:rightCellModel ratio:ratio];
    
    JXCategoryTitleBackgroundImageCellModel *leftModel = (JXCategoryTitleBackgroundImageCellModel *)leftCellModel;
    JXCategoryTitleBackgroundImageCellModel *rightModel = (JXCategoryTitleBackgroundImageCellModel *)rightCellModel;
    if (self.isImageZoomEnabled) {
        leftModel.bgImageCurrentZoomScale = [JXCategoryFactory interpolationFrom:self.imageZoomScale to:1.0 percent:ratio];
        rightModel.bgImageCurrentZoomScale = [JXCategoryFactory interpolationFrom:1.0 to:self.imageZoomScale percent:ratio];
    }
}

- (CGFloat)preferredCellWidthAtIndex:(NSInteger)index {
    CGFloat width = [super preferredCellWidthAtIndex:index];
    if (self.cellWidth == JXCategoryViewAutomaticDimension) {
        if (width < self.imageSize.width) {
            width = self.imageSize.width;
        }
        return width;
    } else {
        return self.cellWidth;
    }
}

@end
