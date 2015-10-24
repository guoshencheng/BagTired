//
//  BookListCell.m
//  BagTired
//
//  Created by guoshencheng on 10/24/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "BookListCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface BookListCell()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation BookListCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)updateWithAvatarImage:(NSString *)avatarImage address:(NSString *)address description:(NSString *)description time:(NSString *)time recivied:(BOOL)recivied {
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:avatarImage] placeholderImage:[UIImage imageNamed:@""]];
    self.addressLabel.text = address;
    self.descriptionLabel.text = description;
    self.backgroundColor = recivied ? [UIColor whiteColor] : [UIColor greenColor];
}

@end
