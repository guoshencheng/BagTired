//
//  UserInfoViewController.m
//  BagTired
//
//  Created by guoshencheng on 10/24/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserInfoViewController+Configuration.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

+ (instancetype)create {
    UserInfoViewController *userInfoViewController = [[UserInfoViewController alloc] initWithNibName:@"UserInfoViewController" bundle:nil];
    return userInfoViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViews];
}


- (IBAction)didClickCloseButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)didClickWrite:(id)sender {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
