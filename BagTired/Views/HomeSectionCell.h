//
//  HomeSectionCell.h
//  BagTired
//
//  Created by guoshencheng on 10/24/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#define HOME_SECTION_COLLECTION_CELL_ID @"HomeSectionCell"
#define HOME_SECTION_COLLECTION_CELL_NIBNAME @"HomeSectionCell"

@interface HomeSectionCell : UICollectionViewCell

- (void)updateWithBackgroundColor:(UIColor *)backgroundColor;
- (void)updateToSecondCell;
- (void)updateToFirstCell;
- (void)updateToThirdCell;
- (void)updateToForthCell;

@end
