//
//  JXCategoryBadgeCell.m
//  JXCategoryViewExt
//
//  Created by QuintGao on 2022/4/19.
//

#import "JXCategoryBadgeCell.h"
#import "JXCategoryBadgeCellModel.h"

@interface JXCategoryBadgeItemView()

@property (nonatomic, strong) UILabel *badgeLabel;
@property (nonatomic, strong) UIImageView *badgeImageView;

@end

@implementation JXCategoryBadgeItemView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.badgeLabel.frame = self.bounds;
    self.badgeImageView.frame = self.bounds;
}

- (void)setCellModel:(JXCategoryBadgeCellModel *)cellModel {
    _cellModel = cellModel;
    
    if (cellModel.badgeType == JXCategoryBadgeType_Image) {
        if (!self.badgeImageView) {
            self.badgeImageView = [[UIImageView alloc] initWithFrame:self.bounds];
            [self addSubview:self.badgeImageView];
        }
    }else {
        if (!self.badgeLabel) {
            self.badgeLabel = [[UILabel alloc] initWithFrame:self.bounds];
            self.badgeLabel.textAlignment = NSTextAlignmentCenter;
            [self addSubview:self.badgeLabel];
        }
        
        self.badgeLabel.backgroundColor = cellModel.badgeBackgroundColor;
        self.badgeLabel.font = cellModel.badgeLabelFont;
        self.badgeLabel.textColor = cellModel.badgeTitleColor;
        self.badgeLabel.text = cellModel.badgeString;
        self.badgeLabel.layer.masksToBounds = YES;
        
        if (cellModel.badgeType == JXCategoryBadgeType_Dot) {
            self.badgeLabel.text = nil;
        }
    }
    !cellModel.updateBlock ?: cellModel.updateBlock(cellModel.index, self, cellModel.badgeInfo);
}

- (void)clear {
    self.badgeLabel.text = nil;
    self.badgeImageView.image = nil;
}

@end

@interface JXCategoryBadgeCell()

@property (nonatomic, strong) NSLayoutConstraint *badgeCenterX;
@property (nonatomic, strong) NSLayoutConstraint *badgeCenterY;
@property (nonatomic, strong) NSLayoutConstraint *badgeWidth;
@property (nonatomic, strong) NSLayoutConstraint *badgeHeight;

@end

@implementation JXCategoryBadgeCell

- (void)prepareForReuse {
    [super prepareForReuse];
    
    [self.badgeItemView clear];
}

- (void)initializeViews {
    [super initializeViews];
    
    self.badgeItemView = [[JXCategoryBadgeItemView alloc] init];
    self.badgeItemView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.badgeItemView];
    self.badgeItemView.translatesAutoresizingMaskIntoConstraints = NO;
    self.badgeCenterX = [self.badgeItemView.centerXAnchor constraintEqualToAnchor:self.titleLabel.trailingAnchor];
    self.badgeCenterY = [self.badgeItemView.centerYAnchor constraintEqualToAnchor:self.titleLabel.topAnchor];
    self.badgeWidth = [self.badgeItemView.widthAnchor constraintEqualToConstant:0];
    self.badgeHeight = [self.badgeItemView.heightAnchor constraintEqualToConstant:0];
    [NSLayoutConstraint activateConstraints:@[self.badgeCenterX, self.badgeCenterY, self.badgeWidth, self.badgeHeight]];
}

- (void)reloadData:(JXCategoryBaseCellModel *)cellModel {
    [super reloadData:cellModel];
    
    JXCategoryBadgeCellModel *myCellModel = (JXCategoryBadgeCellModel *)cellModel;
    self.badgeItemView.cellModel = myCellModel;
    
    if (myCellModel.badgeType == JXCategoryBadgeType_Image) {
        self.badgeWidth.constant = myCellModel.badgeSize.width;
        self.badgeHeight.constant = myCellModel.badgeSize.height;
        self.badgeCenterX.constant = myCellModel.badgeOffset.x;
        self.badgeCenterY.constant = myCellModel.badgeOffset.y;
    }else if (myCellModel.badgeType == JXCategoryBadgeType_Dot) {
        self.badgeItemView.hidden = ![myCellModel.badgeInfo boolValue];
        self.badgeItemView.layer.cornerRadius = myCellModel.dotBadgeCornerRadius;
        self.badgeWidth.constant = myCellModel.dotBadgeSize.width;
        self.badgeHeight.constant = myCellModel.dotBadgeSize.height;
        self.badgeCenterX.constant = myCellModel.dotBadgeOffset.x;
        self.badgeCenterY.constant = myCellModel.dotBadgeOffset.y;
    }else {
        self.badgeItemView.layer.cornerRadius = myCellModel.badgeHeight/2;
        self.badgeHeight.constant = myCellModel.badgeHeight;
        self.badgeCenterX.constant = myCellModel.badgeOffset.x;
        self.badgeCenterY.constant = myCellModel.badgeOffset.y;
        if (myCellModel.badgeType == JXCategoryBadgeType_Number) {
            self.badgeItemView.hidden = [myCellModel.badgeInfo integerValue] == 0;
            if ([myCellModel.badgeInfo integerValue] < 10 && myCellModel.shouldMakeRoundWhenSingleNumber) {
                self.badgeWidth.constant = myCellModel.badgeHeight;
            }else {
                self.badgeWidth.constant = myCellModel.badgeStringWidth + myCellModel.badgeWidthIncrement;
            }
        }else {
            if ([myCellModel.badgeInfo isKindOfClass:[NSString class]]) {
                self.badgeItemView.hidden = [myCellModel.badgeInfo length] <= 0;
            }else {
                self.badgeItemView.hidden = [myCellModel.badgeInfo integerValue] == 0;
            }
            self.badgeWidth.constant = myCellModel.badgeStringWidth + myCellModel.badgeWidthIncrement;
        }
    }
}

@end
