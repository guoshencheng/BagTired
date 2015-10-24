//
//  AddBookView.m
//  BagTired
//
//  Created by guoshencheng on 10/25/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "AddBookView.h"
#import "QREncoder.h"

@interface AddBookView ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *clonseButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;
@property (weak, nonatomic) IBOutlet UIView *maskView;
@property (weak, nonatomic) IBOutlet UIImageView *QRCodeImageView;

@end

@implementation AddBookView

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
}

- (void)setQRText:(NSString *)text {
    DataMatrix* qrMatrix = [QREncoder encodeWithECLevel:QR_ECLEVEL_AUTO version:QR_VERSION_AUTO string:text];
    int qrcodeImageDimension = 250;
    UIImage *qrcodeImage = [QREncoder renderDataMatrix:qrMatrix imageDimension:qrcodeImageDimension];
    self.QRCodeImageView.image = qrcodeImage;
    self.QRCodeImageView.hidden = NO;
    self.finishButton.titleLabel.text = @"返回";
}

+ (instancetype)create {
    AddBookView *addBookView = [[[NSBundle mainBundle] loadNibNamed:@"AddBookView" owner:nil options:nil] lastObject];
    return addBookView;
}

- (void)awakeFromNib {
    self.finishButton.layer.cornerRadius = self.finishButton.frame.size.height / 2;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resign)];
    [self.maskView addGestureRecognizer:tap];
}

- (IBAction)didClickAddButton:(id)sender {
    if ([self.delegate respondsToSelector:@selector(AddBookViewShouldAddPhoto:)]) {
        [self.delegate AddBookViewShouldAddPhoto:self];
    }
}

- (void)resign {
    [self.textView resignFirstResponder];
}

- (void)setHidden:(BOOL)hidden {
    [super setHidden:hidden];
    if (!hidden) {
        [self.textView becomeFirstResponder];
    } else {
        [self.textView resignFirstResponder];
        self.QRCodeImageView.hidden = YES;
    }
}

- (IBAction)didClickCloseButton:(id)sender {
    self.hidden = YES;
}

- (IBAction)didClickBackButton:(id)sender {
    if ([self.finishButton.titleLabel.text isEqualToString:@"返回"]) {
        self.hidden = YES;
    } else if ([self.delegate respondsToSelector:@selector(AddBookViewFinishWithText:image:)]) {
        [self.delegate AddBookViewFinishWithText:self.textView.text image:self.imageView.image];
    }
    
}

@end
