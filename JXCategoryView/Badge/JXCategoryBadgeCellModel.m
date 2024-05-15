//
//  JXCategoryBadgeCellModel.m
//  JXCategoryViewExt
//
//  Created by QuintGao on 2022/4/19.
//

#import "JXCategoryBadgeCellModel.h"

@implementation JXCategoryBadgeCellModel

- (void)setBadgeString:(NSString *)badgeString {
    _badgeString = badgeString;
    [self updateBadgeSizeWidthIfNeeded];
}

- (void)setBadgeHeight:(CGFloat)badgeHeight {
    _badgeHeight = badgeHeight;
    [self updateBadgeSizeWidthIfNeeded];
}

- (void)setBadgeLabelFont:(UIFont *)badgeLabelFont {
    _badgeLabelFont = badgeLabelFont;
    [self updateBadgeSizeWidthIfNeeded];
}

- (void)updateBadgeSizeWidthIfNeeded {
    if (self.badgeLabelFont != nil) {
        _badgeStringWidth = [self.badgeString boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.badgeHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.badgeLabelFont} context:nil].size.width;
    }
}

@end
