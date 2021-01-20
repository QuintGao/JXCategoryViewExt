//
//  JXCategoryDotZoomView.m
//  Example
//
//  Created by gaokun on 2021/1/18.
//

#import "JXCategoryDotZoomView.h"

@implementation JXCategoryDotZoomView

- (void)initializeData {
    [super initializeData];

    _dotStyle = JXCategoryDotStyle_Solid;
    _dotWH = 10;
    _hollowWH = 5;
    _dotColor = [UIColor redColor];
    _dotOffset = CGPointZero;
}

- (Class)preferredCellClass {
    return [JXCategoryDotZoomCell class];
}

- (void)refreshDataSource {
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:self.titles.count];
    for (int i = 0; i < self.titles.count; i++) {
        JXCategoryDotZoomCellModel *cellModel = [[JXCategoryDotZoomCellModel alloc] init];
        [tempArray addObject:cellModel];
    }
    self.dataSource = [NSArray arrayWithArray:tempArray];
}

- (void)refreshCellModel:(JXCategoryBaseCellModel *)cellModel index:(NSInteger)index {
    [super refreshCellModel:cellModel index:index];

    JXCategoryDotZoomCellModel *myCellModel = (JXCategoryDotZoomCellModel *)cellModel;
    myCellModel.dotStyle = self.dotStyle;
    myCellModel.dotWH = self.dotWH;
    myCellModel.dotColor = self.dotColor;
    myCellModel.dotOffset = self.dotOffset;
    myCellModel.hollowWH = self.hollowWH;
}

- (void)refreshLeftCellModel:(JXCategoryBaseCellModel *)leftCellModel rightCellModel:(JXCategoryBaseCellModel *)rightCellModel ratio:(CGFloat)ratio {
    [super refreshLeftCellModel:leftCellModel rightCellModel:rightCellModel ratio:ratio];
    
    JXCategoryDotZoomCellModel *myLeftCellModel = (JXCategoryDotZoomCellModel *)leftCellModel;
    myLeftCellModel.ratio = ratio;
    
    JXCategoryDotZoomCellModel *myRightCellModel = (JXCategoryDotZoomCellModel *)rightCellModel;
    myRightCellModel.ratio = 1 - ratio;
}

@end
