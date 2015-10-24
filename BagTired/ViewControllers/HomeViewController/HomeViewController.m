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
#import "UIColor+Utility.h"
#import "AFNetworking.h"
#import "UIImage+Utility.h"
#import "CheckInfoViewController.h"
#import "BookListViewController.h"
#import "NSDictionary+Utility.h"
#import "NSString+Utility.h"

@implementation HomeViewController

+ (instancetype)create {
    HomeViewController *homeViewController = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    return homeViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager GET:@"http://121.199.78.191:3000/user/get?uid=2" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [[NSUserDefaults standardUserDefaults] setObject:responseObject forKey:@"storeInfo"];
        [self.selectionCollectionView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    [manager GET:@"http://121.199.78.191:3000/user/get?uid=11" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [[NSUserDefaults standardUserDefaults] setObject:responseObject forKey:@"userInfo"];
//        self.storeInfo = responseObject;
        [self.selectionCollectionView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    [self configureViews];
    
}

- (IBAction)didClickUserInfomation:(id)sender {
    UserInfoViewController *userInfoViewController = [UserInfoViewController create];
    [self.navigationController pushViewController:userInfoViewController animated:YES];
}

- (IBAction)didClickBookListButton:(id)sender {
    BookListViewController *bookListViewController = [BookListViewController create];
    [self.navigationController pushViewController:bookListViewController animated:YES];
}


#pragma mark - QRCodeReaderDelegate

- (void)reader:(QRCodeReaderViewController *)reader didScanResult:(NSString *)result {
    NSDictionary *dic = [[NSString dictionaryWithJsonString:result] copy];
    CheckInfoViewController *viewController = [CheckInfoViewController create];
    viewController.info = dic;
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (void)readerDidCancel:(QRCodeReaderViewController *)reader {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - CollecionViewDatasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeSectionCell *cell;
    if (indexPath.item == 0) {
        cell =  [self handleFirstCellWithCollectionView:collectionView indexPath:indexPath];
    } else if (indexPath.item == 1) {
        cell = [self handleSecondCellWithCollectionView:collectionView indexPath:indexPath];
    } else if (indexPath.item == 2) {
        cell = [self handleThirdCellWithCollectionView:collectionView indexPath:indexPath];
    }
    cell.delegate = self;
    return cell;
}

- (HomeSectionCell *)handleFirstCellWithCollectionView:(UICollectionView *)collectionView  indexPath:(NSIndexPath *)indexPath {
    HomeSectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HOME_SECTION_COLLECTION_CELL_ID forIndexPath:indexPath];
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"] objectForKey:@"loginName"]) {
        [cell updateToFirstCellWithName:[[[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"] objectForKey:@"loginName"] tele:[[[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"] objectForKey:@"phone"] address:[[[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"]  objectForKey:@"address"]];
    } else {
        [cell updateToFirstCellWithName:@"guoshencheng" tele:@"137xxxxxxxx" address:@"xxxxxxxxxx"];
    }
    return cell;
}

- (HomeSectionCell *)handleSecondCellWithCollectionView:(UICollectionView *)collectionView  indexPath:(NSIndexPath *)indexPath {
    HomeSectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HOME_SECTION_COLLECTION_CELL_ID forIndexPath:indexPath];
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"storeInfo"] objectForKey:@"loginName"]) {
        [cell updateToSecondCellWithName:[[[NSUserDefaults standardUserDefaults] objectForKey:@"storeInfo"] objectForKey:@"loginName"] tele:[[[NSUserDefaults standardUserDefaults] objectForKey:@"storeInfo"] objectForKey:@"phone"] address:[[[NSUserDefaults standardUserDefaults] objectForKey:@"storeInfo"] objectForKey:@"address"]];
    } else {
        [cell updateToSecondCellWithName:nil tele:@"" address:@""];
    }
    return cell;
}

- (HomeSectionCell *)handleThirdCellWithCollectionView:(UICollectionView *)collectionView  indexPath:(NSIndexPath *)indexPath {
    HomeSectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HOME_SECTION_COLLECTION_CELL_ID forIndexPath:indexPath];
    [cell updateToThirdCell];
    return cell;
}

- (void)HomeSectionCellDidClickBottomRightButton:(HomeSectionCell *)cell {
    
}

- (void)HomeSectionCellDidClickScanButton:(HomeSectionCell *)cell {
    if (cell.tag == 0) {
        [self pushQRCodeViewController];
    } else {
        self.addBookView.hidden = NO;
    }
}

- (void)pushQRCodeViewController {
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

- (void)AddBookViewFinishWithText:(NSString *)text image:(UIImage *)image {
//    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"boy" ofType:@"png"];
    NSDictionary *param = @{@"sellerId":[[[NSUserDefaults standardUserDefaults] objectForKey:@"storeInfo"] objectForKey:@"id"], @"orderName":text};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:@"http://121.199.78.191:3000/orderMenu/setOrder" parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFileURL:[NSURL fileURLWithPath:imagePath] name:@"file" fileName:@"file" mimeType:@"image/jpeg" error:nil];
        [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 0.2) name:@"file" fileName:@"file" mimeType:@"png"];
        
    } error:nil];
    NSProgress *progress = nil;
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:&progress completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            NSDictionary *result = responseObject;
            [self.addBookView setQRText:[result toJsonString]];
        }
    }];
    [uploadTask resume];
}

- (void)AddBookViewShouldAddPhoto:(AddBookView *)addBookView {
    self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        return;
    }
    [self presentViewController:self.picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissViewControllerAnimated:NO completion:nil];
    UIImage *image = [UIImage fixOrientation:[info objectForKey:UIImagePickerControllerOriginalImage]];
    if (self.picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    [self.addBookView setImage:image];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo {
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误" message:@"保存失败，请检查应用相机权限" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
