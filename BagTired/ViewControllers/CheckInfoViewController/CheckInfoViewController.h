//
//  CheckInfoViewController.h
//  BagTired
//
//  Created by guoshencheng on 10/25/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "BaseViewController.h"

@interface CheckInfoViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UILabel *packageLabel;
@property (weak, nonatomic) IBOutlet UILabel *packageContontLabel;
@property (weak, nonatomic) IBOutlet UIView *container;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *originAddress;
@property (weak, nonatomic) IBOutlet UILabel *contacterLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressContontLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactContontLabel;
@property (weak, nonatomic) IBOutlet UILabel *teleContontLabel;
@property (weak, nonatomic) IBOutlet UILabel *originContontLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeContontLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;

@property (strong, nonatomic) NSDictionary *info;

@end
