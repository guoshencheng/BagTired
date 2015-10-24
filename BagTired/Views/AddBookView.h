//
//  AddBookView.h
//  BagTired
//
//  Created by guoshencheng on 10/25/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddBookViewDelegate;

@interface AddBookView : UIView

@property (weak, nonatomic) id<AddBookViewDelegate> delegate;

+ (instancetype)create;
- (void)setImage:(UIImage *)image;
- (void)setQRText:(NSString *)text;
@end

@protocol AddBookViewDelegate <NSObject>
@optional
- (void)AddBookViewShouldAddPhoto:(AddBookView *)addBookView;
- (void)AddBookViewFinishWithText:(NSString *)text image:(UIImage *)image;

@end