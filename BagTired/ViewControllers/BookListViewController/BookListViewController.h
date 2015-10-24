//
//  BookListViewController.h
//  BagTired
//
//  Created by guoshencheng on 10/24/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "BaseViewController.h"

@interface BookListViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *bookArray;

@end
