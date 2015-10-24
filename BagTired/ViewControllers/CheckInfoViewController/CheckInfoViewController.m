//
//  CheckInfoViewController.m
//  BagTired
//
//  Created by guoshencheng on 10/25/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "CheckInfoViewController.h"
#import "AFNetworking.h"
#import "NSDictionary+Utility.h"

@interface CheckInfoViewController ()

@end

@implementation CheckInfoViewController

+ (instancetype)create {
    CheckInfoViewController *viewController = [[CheckInfoViewController alloc] initWithNibName:@"CheckInfoViewController" bundle:nil];
    return viewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.confirmButton.layer.cornerRadius = self.confirmButton.frame.size.height / 2;
}

- (IBAction)clickConfirmButton:(id)sender {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager GET:@"http://121.199.78.191:3000/orderMenu/confirm" parameters:@{@"orderId" : [self.info objectForKey:@"orderId"]  , @"userId":[[[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"] objectForKey:@"id"]} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
}

@end
