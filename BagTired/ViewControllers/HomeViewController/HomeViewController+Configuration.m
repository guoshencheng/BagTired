//
//  HomeViewController+Configuration.m
//  BagTired
//
//  Created by guoshencheng on 10/24/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController+Configuration.h"
#import "HomeSectionCell.h"
#import "Masonry.h"

@implementation HomeViewController (Configuration)

- (void)configureViews {
    [self configureCollectionView];
    [self addAddBookView];
    [self configureImagePicker];
}

- (void)configureCollectionView {
    [self.selectionCollectionView registerNib:[UINib nibWithNibName:HOME_SECTION_COLLECTION_CELL_NIBNAME bundle:nil] forCellWithReuseIdentifier:HOME_SECTION_COLLECTION_CELL_ID];
    self.selectionCollectionView.delegate = self;
    self.selectionCollectionView.dataSource = self;
}

- (void)addAddBookView {
    self.addBookView = [AddBookView create];
    [self.view addSubview:self.addBookView];
    [self.addBookView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.right.equalTo(@(0));
        make.top.equalTo(@(0));
        make.bottom.equalTo(@(0));
    }];
    self.addBookView.delegate = self;
    self.addBookView.hidden = YES;
}

- (void)configureImagePicker {
    self.picker = [[UIImagePickerController alloc] init];
    self.picker.allowsEditing = NO;
    self.picker.delegate = self;
}

@end
