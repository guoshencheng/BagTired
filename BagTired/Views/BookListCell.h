//
//  BookListCell.h
//  BagTired
//
//  Created by guoshencheng on 10/24/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#define BOOK_LIST_CELL_ID @"BookListCell"
#define BOOK_LIST_CELL_NIBNAME @"BookListCell"

@interface BookListCell : UITableViewCell

- (void)updateWithAvatarImage:(NSString *)avatarImage address:(NSString *)address description:(NSString *)description time:(NSString *)time recivied:(BOOL)recivied;

@end
