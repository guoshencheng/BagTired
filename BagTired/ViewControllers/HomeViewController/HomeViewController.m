//
//  HomeViewController.m
//  BagTired
//
//  Created by guoshencheng on 10/24/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewController+Configuration.h"
#import "UserInfoViewController.h"
#import "HomeSectionCell.h"
#import "UIColor+Utility.h"

@implementation HomeViewController

+ (instancetype)create {
    HomeViewController *homeViewController = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    return homeViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViews];
}

- (IBAction)didClickUserInfomation:(id)sender {
    UserInfoViewController *userInfoViewController = [UserInfoViewController create];
    [self.navigationController pushViewController:userInfoViewController animated:YES];
}

- (IBAction)didClickScan:(id)sender {
    if ([QRCodeReader supportsMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]]) {
        static QRCodeReaderViewController *reader = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            reader = [QRCodeReaderViewController new];
        });
        reader.delegate = self;
        [self.navigationController pushViewController:reader animated:YES];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Reader not supported by the current device" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

#pragma mark - QRCodeReaderDelegate

- (void)reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result {
    NSLog(@"%@", result);
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)readerDidCancel:(QRCodeReaderViewController *)reader {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - CollecionViewDatasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item == 0) {
        return [self handleFirstCellWithCollectionView:collectionView indexPath:indexPath];
    } else if (indexPath.item == 1) {
        return [self handleSecondCellWithCollectionView:collectionView indexPath:indexPath];
    } else if (indexPath.item == 2) {
        return [self handleThirdCellWithCollectionView:collectionView indexPath:indexPath];
    }
    HomeSectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HOME_SECTION_COLLECTION_CELL_ID forIndexPath:indexPath];
    return cell;
}

- (HomeSectionCell *)handleFirstCellWithCollectionView:(UICollectionView *)collectionView  indexPath:(NSIndexPath *)indexPath {
    HomeSectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HOME_SECTION_COLLECTION_CELL_ID forIndexPath:indexPath];
    [cell updateToFirstCell];
    return cell;
}

- (HomeSectionCell *)handleSecondCellWithCollectionView:(UICollectionView *)collectionView  indexPath:(NSIndexPath *)indexPath {
    HomeSectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HOME_SECTION_COLLECTION_CELL_ID forIndexPath:indexPath];
    [cell updateToSecondCell];
    return cell;
}

- (HomeSectionCell *)handleThirdCellWithCollectionView:(UICollectionView *)collectionView  indexPath:(NSIndexPath *)indexPath {
    HomeSectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HOME_SECTION_COLLECTION_CELL_ID forIndexPath:indexPath];
    [cell updateToThirdCell];
    return cell;
}

@end
