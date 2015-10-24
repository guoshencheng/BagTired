//
//  HomeViewController+Configuration.m
//  BagTired
//
//  Created by guoshencheng on 10/24/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController+Configuration.h"
#import "HomeSectionCell.h"

@implementation HomeViewController (Configuration)

- (void)configureViews {
    [self configureCollectionView];
}

- (void)configureCollectionView {
    [self.selectionCollectionView registerNib:[UINib nibWithNibName:HOME_SECTION_COLLECTION_CELL_NIBNAME bundle:nil] forCellWithReuseIdentifier:HOME_SECTION_COLLECTION_CELL_ID];
    self.selectionCollectionView.delegate = self;
    self.selectionCollectionView.dataSource = self;
}

@end
