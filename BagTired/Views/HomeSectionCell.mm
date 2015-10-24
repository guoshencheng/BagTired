//
//  HomeSectionCell.m
//  BagTired
//
//  Created by guoshencheng on 10/24/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "HomeSectionCell.h"
#import "UIColor+Utility.h"
#import "QREncoder.h"

@interface HomeSectionCell()

@property (weak, nonatomic) IBOutlet UIView *imfomationView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIImageView *insertImageView;
@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *insertImageViewLeftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *insertImageViewRightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelLeftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelRightConstaint;
@property (weak, nonatomic) IBOutlet UIImageView *bottomButton;
@property (weak, nonatomic) IBOutlet UIImageView *descriptionImageView;
@property (weak, nonatomic) IBOutlet UIImageView *QRCodeImageView;
@property (weak, nonatomic) IBOutlet UIButton *realBottomButton;
@property (weak, nonatomic) IBOutlet UIImageView *rightBottomButton;
@property (weak, nonatomic) IBOutlet UIButton *realRightBottomButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *teleNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *adressLabel;
@property (weak, nonatomic) IBOutlet UILabel *noInfomationLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *teleNumberContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressContentLabel;

@end

@implementation HomeSectionCell

- (void)awakeFromNib {
    self.containerView.layer.cornerRadius = 5;
}

- (void)updateToFirstCellWithName:(NSString *)name tele:(NSString *)tele address:(NSString *)address {
    self.nameLabel.text = @"姓名";
    [self showHideBaseInfo:NO];
    [self updateWithName:name address:address tele:tele];
    self.containerView.backgroundColor = [UIColor firstBackground];
    self.insertImageViewLeftConstraint.constant = 10;
    self.insertImageViewRightConstraint.constant = 160;
    self.titleLabelLeftConstraint.constant = 125;
    self.titleLabelRightConstaint.constant = 15;
    self.insertImageView.image = [UIImage imageNamed:@"girl"];
    self.titleImageView.image = [UIImage imageNamed:@"first_selection_text"];
    self.bottomButton.image = [UIImage imageNamed:@"scan_button"];
    self.descriptionImageView.image = [UIImage imageNamed:@"first_selection_description"];
    self.tag = 0;
    [self showHideRightBottomButton:YES];
    [self showHideSomeViews:NO];
}

- (void)updateToSecondCellWithName:(NSString *)name tele:(NSString *)tele address:(NSString *)address {
    if (name) {
        [self showHideBaseInfo:NO];
        [self updateWithName:name address:address tele:tele];
    } else {
        [self showHideBaseInfo:YES];
    }
    self.nameLabel.text = @"店铺";
    self.containerView.backgroundColor = [UIColor secondBackgound];
    self.insertImageViewRightConstraint.constant = 10;
    self.insertImageViewLeftConstraint.constant = 160;
    self.titleLabelRightConstaint.constant = 125;
    self.titleLabelLeftConstraint.constant = 15;
    self.insertImageView.image = [UIImage imageNamed:@"boy"];
    self.titleImageView.image = [UIImage imageNamed:@"second_selection_text"];
    self.bottomButton.image = [UIImage imageNamed:@"add_book_button"];
    self.descriptionImageView.image = [UIImage imageNamed:@"second_selection_description"];
    self.tag = 1;
    [self showHideRightBottomButton:NO];
    [self showHideSomeViews:NO];
}

- (void)updateToThirdCell {
    DataMatrix* qrMatrix = [QREncoder encodeWithECLevel:QR_ECLEVEL_AUTO version:QR_VERSION_AUTO string:@"http://dota.178.com/list/95555290371.html?"];
    int qrcodeImageDimension = 250;
    UIImage *qrcodeImage = [QREncoder renderDataMatrix:qrMatrix imageDimension:qrcodeImageDimension];
    self.QRCodeImageView.image = qrcodeImage;
    self.insertImageViewRightConstraint.constant = 10;
    self.insertImageViewLeftConstraint.constant = 160;
    self.titleLabelRightConstaint.constant = 125;
    self.titleLabelLeftConstraint.constant = 15;
    self.containerView.backgroundColor = [UIColor thirdBackground];
    self.insertImageView.image = [UIImage imageNamed:@"third_selection_text"];
    self.titleImageView.image = [UIImage imageNamed:@"yellow"];
    [self showHideSomeViews:YES];
    [self showHideRightBottomButton:YES];
}

- (void)updateWithName:(NSString *)name address:(NSString *)address tele:(NSString *)tele {
    self.nameContentLabel.text = name;
    self.addressContentLabel.text = address;
    self.teleNumberContentLabel.text = tele;
}

- (void)showHideBaseInfo:(BOOL)hide {
    self.noInfomationLabel.hidden = !hide;
    self.nameLabel.hidden = hide;
    self.addressContentLabel.hidden = hide;
    self.adressLabel.hidden = hide;
    self.nameContentLabel.hidden = hide;
    self.teleNumberLabel.hidden = hide;
    self.teleNumberContentLabel.hidden = hide;
}

- (void)showHideRightBottomButton:(BOOL)hide {
    self.rightBottomButton.hidden = hide;
    self.realRightBottomButton.hidden = hide;
}

- (void)showHideSomeViews:(BOOL)hide {
    self.QRCodeImageView.hidden = !hide;
    self.imfomationView.hidden = hide;
    self.descriptionImageView.hidden = hide;
    self.bottomButton.hidden = hide;
    self.realBottomButton.hidden = hide;
}

- (void)updateWithBackgroundColor:(UIColor *)backgroundColor {
    self.containerView.backgroundColor = backgroundColor;
}

- (IBAction)clickScanButton:(id)sender {
    if ([self.delegate respondsToSelector:@selector(HomeSectionCellDidClickScanButton:)]) {
        [self.delegate HomeSectionCellDidClickScanButton:self];
    }
}

- (IBAction)rightBottomButtonClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(HomeSectionCellDidClickBottomRightButton:)]) {
        [self.delegate HomeSectionCellDidClickBottomRightButton:self];
    }
}

@end
