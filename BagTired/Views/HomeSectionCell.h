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

@protocol HomeSectionCellDelegate;
@interface HomeSectionCell : UICollectionViewCell

@property (weak, nonatomic) id<HomeSectionCellDelegate> delegate;

- (void)updateWithBackgroundColor:(UIColor *)backgroundColor;
- (void)updateToSecondCellWithName:(NSString *)name tele:(NSString *)tele address:(NSString *)address;
- (void)updateToFirstCellWithName:(NSString *)name tele:(NSString *)tele address:(NSString *)address;
- (void)updateToThirdCell;

@end

@protocol HomeSectionCellDelegate <NSObject>
@optional
- (void)HomeSectionCellDidClickScanButton:(HomeSectionCell *)cell;
- (void)HomeSectionCellDidClickBottomRightButton:(HomeSectionCell *)cell;

@end
