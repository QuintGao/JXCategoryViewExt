//
//  JXCategoryBadgeView.m
//  JXCategoryViewExt
//
//  Created by QuintGao on 2022/4/19.
//

#import "JXCategoryBadgeView.h"

@implementation JXCategoryBadgeView

- (void)dealloc {
    self.badgeStringFormatterBlock = nil;
    self.updateBlock = nil;
}

- (void)initializeData {
    [super initializeData];
    
    self.cellSpacing = 25;
    _badgeTitleColor = UIColor.whiteColor;
    _badgeBackgroundColor = UIColor.redColor;
    _badgeHeight = 14;
    _badgeWithIncrement = 10;
    _badgeLabelFont = [UIFont systemFontOfSize:11];
    _badgeSize = CGSizeZero;
    _badgeOffset = CGPointZero;
    _shouldMakeRoundWhenSingleNumber = NO;
    _dotBadgeSize = CGSizeMake(10, 10);
    _dotBadgeCornerRadius = JXCategoryViewAutomaticDimension;
    _dotBadgeOffset = CGPointZero;
}

- (Class)preferredCellClass {
    return [JXCategoryBadgeCell class];
}

- (void)refreshDataSource {
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:self.titles.count];
    for (int i = 0; i < self.titles.count; i++) {
        JXCategoryBadgeCellModel *cellModel = [[JXCategoryBadgeCellModel alloc] init];
        [tempArray addObject:cellModel];
    }
    self.dataSource = [NSArray arrayWithArray:tempArray];
}

- (void)refreshCellModel:(JXCategoryBaseCellModel *)cellModel index:(NSInteger)index {
    [super refreshCellModel:cellModel index:index];
    
    JXCategoryBadgeCellModel *myCellModel = (JXCategoryBadgeCellModel *)cellModel;
    myCellModel.badgeType = [self.badgeTypes[index] integerValue];
    myCellModel.badgeInfo = self.badgeInfos[index];
    if (self.badgeStringFormatterBlock) {
        myCellModel.badgeString = self.badgeStringFormatterBlock(myCellModel.badgeType, myCellModel.badgeInfo);
    }else {
        myCellModel.badgeString = [NSString stringWithFormat:@"%@", myCellModel.badgeInfo];
    }
    myCellModel.updateBlock = self.updateBlock;
    myCellModel.badgeBackgroundColor = self.badgeBackgroundColor;
    myCellModel.badgeTitleColor = self.badgeTitleColor;
    myCellModel.badgeLabelFont = self.badgeLabelFont;
    myCellModel.badgeHeight = self.badgeHeight;
    myCellModel.badgeSize = self.badgeSize;
    myCellModel.badgeOffset = self.badgeOffset;
    myCellModel.badgeWidthIncrement = self.badgeWithIncrement;
    myCellModel.shouldMakeRoundWhenSingleNumber = self.shouldMakeRoundWhenSingleNumber;
    myCellModel.dotBadgeSize = self.dotBadgeSize;
    myCellModel.dotBadgeOffset = self.dotBadgeOffset;
    if (self.dotBadgeCornerRadius == JXCategoryViewAutomaticDimension) {
        myCellModel.dotBadgeCornerRadius = self.dotBadgeSize.height/2;
    }else {
        myCellModel.dotBadgeCornerRadius = self.dotBadgeCornerRadius;
    }
}

@end
