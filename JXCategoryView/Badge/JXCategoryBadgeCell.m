//
//  JXCategoryBadgeCell.m
//  JXCategoryViewExt
//
//  Created by QuintGao on 2022/4/19.
//

#import "JXCategoryBadgeCell.h"
#import "JXCategoryBadgeCellModel.h"

@interface JXCategoryBadgeCell()

@property (nonatomic, strong) NSLayoutConstraint *badgeCenterX;
@property (nonatomic, strong) NSLayoutConstraint *badgeCenterY;
@property (nonatomic, strong) NSLayoutConstraint *badgeWidth;
@property (nonatomic, strong) NSLayoutConstraint *badgeHeight;

@end

@implementation JXCategoryBadgeCell

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.badgeLabel.text = nil;
}

- (void)initializeViews {
    [super  initializeViews];
    
    self.badgeLabel = [[UILabel alloc] init];
    self.badgeLabel.textAlignment = NSTextAlignmentCenter;
    self.badgeLabel.layer.masksToBounds = YES;
    [self.contentView addSubview:self.badgeLabel];
    self.badgeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.badgeCenterX = [self.badgeLabel.centerXAnchor constraintEqualToAnchor:self.titleLabel.trailingAnchor];
    self.badgeCenterY = [self.badgeLabel.centerYAnchor constraintEqualToAnchor:self.titleLabel.topAnchor];
    self.badgeWidth = [self.badgeLabel.widthAnchor constraintEqualToConstant:0];
    self.badgeHeight = [self.badgeLabel.heightAnchor constraintEqualToConstant:0];
    [NSLayoutConstraint activateConstraints:@[self.badgeCenterX, self.badgeCenterY, self.badgeWidth, self.badgeHeight]];
}

- (void)reloadData:(JXCategoryBaseCellModel *)cellModel {
    [super reloadData:cellModel];
    
    JXCategoryBadgeCellModel *myCellModel = (JXCategoryBadgeCellModel *)cellModel;
    self.badgeLabel.backgroundColor = myCellModel.badgeBackgroundColor;
    self.badgeLabel.textColor = myCellModel.badgeTitleColor;
    self.badgeLabel.font = myCellModel.badgeLabelFont;
    self.badgeLabel.text = myCellModel.badgeString;
    !myCellModel.badgeStyleBlock ?: myCellModel.badgeStyleBlock(myCellModel.index, self.badgeLabel);
    
    if (myCellModel.badgeType == JXCategoryBadgeType_Dot) {
        self.badgeLabel.hidden = ![myCellModel.badge boolValue];
        self.badgeLabel.text = nil;
        self.badgeLabel.layer.cornerRadius = myCellModel.dotBadgeCornerRadius;
        self.badgeWidth.constant = myCellModel.dotBadgeSize.width;
        self.badgeHeight.constant = myCellModel.dotBadgeSize.height;
        self.badgeCenterX.constant = myCellModel.dotBadgeOffset.x;
        self.badgeCenterY.constant = myCellModel.dotBadgeOffset.y;
    }else {
        self.badgeLabel.layer.cornerRadius = myCellModel.badgeLabelHeight/2;
        self.badgeHeight.constant = myCellModel.badgeLabelHeight;
        self.badgeCenterX.constant = myCellModel.badgeLabelOffset.x;
        self.badgeCenterY.constant = myCellModel.badgeLabelOffset.y;
        if (myCellModel.badgeType == JXCategoryBadgeType_Number) {
            self.badgeLabel.hidden = [myCellModel.badge integerValue] == 0;
            if ([myCellModel.badge integerValue] < 10 && myCellModel.shouldMakeRoundWhenSingleNumber) {
                self.badgeWidth.constant = myCellModel.badgeLabelHeight;
            }else {
                self.badgeWidth.constant = myCellModel.badgeStringWidth + myCellModel.badgeLabelWidthIncrement;
            }
        }else {
            if ([myCellModel.badge isKindOfClass:[NSString class]]) {
                self.badgeLabel.hidden = [myCellModel.badge length] <= 0;
            }else {
                self.badgeLabel.hidden = [myCellModel.badge integerValue] == 0;
            }
            self.badgeWidth.constant = myCellModel.badgeStringWidth + myCellModel.badgeLabelWidthIncrement;
        }
    }
}

@end
