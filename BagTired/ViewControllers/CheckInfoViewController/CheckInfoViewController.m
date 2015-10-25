//
//  CheckInfoViewController.m
//  BagTired
//
//  Created by guoshencheng on 10/25/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "CheckInfoViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "NSDictionary+Utility.h"
#import <SDWebImage/UIImageView+WebCache.h>

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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:[self.info objectForKey:@"fullImageUrl"]]];
    self.packageContontLabel.text = [self.info objectForKey:@"orderName"];
    self.contactContontLabel.text = [[[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"] objectForKey:@"loginName"];
    self.teleContontLabel.text = [[[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"] objectForKey:@"phone"];
    self.addressContontLabel.text = [[[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"] objectForKey:@"address"];
    self.timeContontLabel.text = [NSString stringWithFormat:@"%@ %@", [[self.info objectForKey:@"arriveTime"] stringValue], @"小时"];
}

- (IBAction)clickConfirmButton:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager GET:@"http://121.199.78.191:3000/orderMenu/confirm" parameters:@{@"orderId" : [self.info objectForKey:@"orderId"]  , @"userId":[[[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"] objectForKey:@"id"]} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
}

@end
