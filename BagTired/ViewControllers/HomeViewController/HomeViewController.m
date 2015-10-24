//
//  HomeViewController.m
//  BagTired
//
//  Created by guoshencheng on 10/24/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "HomeViewController.h"
#import "UserInfoViewController.h"

@implementation HomeViewController

+ (instancetype)create {
    HomeViewController *homeViewController = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    return homeViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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


@end
