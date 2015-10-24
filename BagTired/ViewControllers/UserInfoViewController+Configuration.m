//
//  UserInfoViewController+Configuration.m
//  BagTired
//
//  Created by guoshencheng on 10/24/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "UserInfoViewController+Configuration.h"
#import "UIColor+Utility.h"


@implementation UserInfoViewController (Configuration)

- (void)configureViews {
    [self addBorder];
}

- (void)addBorder {
    self.BaseInfoView.layer.borderWidth = 1;
    self.BaseInfoView.layer.borderColor = [[UIColor colorFromHexCode:@"dedede"] CGColor];
    self.BaseInfoView.layer.cornerRadius = 5;
    self.accountView.layer.borderWidth = 1;
    self.accountView.layer.borderColor = [[UIColor colorFromHexCode:@"dedede"] CGColor];
    self.accountView.layer.cornerRadius = 5;
    self.addressView.layer.borderWidth = 1;
    self.addressView.layer.borderColor = [[UIColor colorFromHexCode:@"dedede"] CGColor];
    self.addressView.layer.cornerRadius = 5;
    
}

@end
