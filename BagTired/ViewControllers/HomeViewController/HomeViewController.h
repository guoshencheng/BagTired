//
//  HomeViewController.h
//  BagTired
//
//  Created by guoshencheng on 10/24/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "BaseViewController.h"
#import "QRCodeReaderViewController.h"
#import "QRCodeReader.h"
#import "HomeSectionCell.h"
#import "AddBookView.h"

@interface HomeViewController : BaseViewController<QRCodeReaderDelegate, UICollectionViewDelegate, UICollectionViewDataSource, HomeSectionCellDelegate, AddBookViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *selectionCollectionView;
@property (strong, nonatomic) UIImagePickerController *picker;
@property (strong, nonatomic) AddBookView *addBookView;

@end
