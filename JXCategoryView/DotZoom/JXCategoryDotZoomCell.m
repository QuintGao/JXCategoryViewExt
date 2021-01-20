//
//  JXCategoryDotZoomCell.m
//  Example
//
//  Created by gaokun on 2021/1/18.
//

#import "JXCategoryDotZoomCell.h"
#import "JXCategoryDotZoomCellModel.h"

@interface JXCategoryDotZoomCell()

@property (nonatomic, strong) UIView *dot;

@property (nonatomic, strong) UIView *hollow;

@end

@implementation JXCategoryDotZoomCell

- (void)initializeViews {
    [super initializeViews];
    
    _dot = [[UIView alloc] init];
    [self.contentView addSubview:self.dot];
    self.dot.translatesAutoresizingMaskIntoConstraints = NO;
    
    _hollow = [[UIView alloc] init];
    self.hollow.backgroundColor = UIColor.whiteColor;
    [self.contentView addSubview:self.hollow];
    self.hollow.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)reloadData:(JXCategoryBaseCellModel *)cellModel {
    [super reloadData:cellModel];

    JXCategoryDotZoomCellModel *myCellModel = (JXCategoryDotZoomCellModel *)cellModel;
    self.dot.backgroundColor = myCellModel.dotColor;
    self.dot.layer.cornerRadius = myCellModel.dotWH / 2;
    self.hollow.layer.cornerRadius = myCellModel.hollowWH / 2;
    [NSLayoutConstraint deactivateConstraints:self.dot.constraints];
    [self.dot.widthAnchor constraintEqualToConstant:myCellModel.dotWH].active = YES;
    [self.dot.heightAnchor constraintEqualToConstant:myCellModel.dotWH].active = YES;
    [self.dot.centerXAnchor constraintEqualToAnchor:self.titleLabel.trailingAnchor constant:myCellModel.dotOffset.x].active = YES;
    [self.dot.centerYAnchor constraintEqualToAnchor:self.titleLabel.topAnchor constant:myCellModel.dotOffset.y].active = YES;
    
    [NSLayoutConstraint deactivateConstraints:self.hollow.constraints];
    [self.hollow.widthAnchor constraintEqualToConstant:myCellModel.hollowWH].active = YES;
    [self.hollow.heightAnchor constraintEqualToConstant:myCellModel.hollowWH].active = YES;
    [self.hollow.centerXAnchor constraintEqualToAnchor:self.dot.centerXAnchor].active = YES;
    [self.hollow.centerYAnchor constraintEqualToAnchor:self.dot.centerYAnchor].active = YES;
    self.hollow.hidden = myCellModel.dotStyle == JXCategoryDotStyle_Solid;
    
    CGAffineTransform transform = CGAffineTransformMakeScale(0, 0);
    if (myCellModel.isSelected || myCellModel.ratio != 0) {
        transform = CGAffineTransformMakeScale(1 - myCellModel.ratio, 1 - myCellModel.ratio);
    }
    self.dot.transform = transform;
    self.hollow.transform = transform;
}

@end
