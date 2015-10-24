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

@end

@implementation HomeSectionCell

- (void)awakeFromNib {
    self.containerView.layer.cornerRadius = 5;
}

- (void)updateToFirstCell {
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
    [self showHideSomeViews:NO];
}

- (void)updateToSecondCell {
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
    self.insertImageView.image = [UIImage imageNamed:@"yellow"];
    self.titleImageView.image = [UIImage imageNamed:@"third_selection_text"];
    [self showHideSomeViews:YES];
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
    if (self.tag == 0) {
        
    } else if(self.tag == 1) {
        
    } else if (self.tag == 2) {
        
    }
}

@end
