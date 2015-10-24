//
//  BookListViewController.m
//  BagTired
//
//  Created by guoshencheng on 10/24/15.
//  Copyright © 2015 guoshencheng. All rights reserved.
//

#import "BookListViewController.h"
#import "UserInfoViewController.h"
#import "BookListCell.h"
#import "AFNetworking.h"


@interface BookListViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation BookListViewController

+ (instancetype)create {
    BookListViewController *bookListViewController = [[BookListViewController alloc] initWithNibName:@"BookListViewController" bundle:nil];
    return bookListViewController;
}

- (void)viewDidLoad {
    self.bookArray = [[NSArray alloc] init];
    [super viewDidLoad];
    self.backButton.layer.cornerRadius = self.backButton.frame.size.height / 2;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:BOOK_LIST_CELL_NIBNAME bundle:nil] forCellReuseIdentifier:BOOK_LIST_CELL_ID];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager GET:@"http://121.199.78.191:3000/orderMenu/getAllOrders" parameters:@{@"userId":[[[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"] objectForKey:@"id"]} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        self.bookArray = responseObject;
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
}

- (IBAction)didClickBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)didClickUserInfoButton:(id)sender {
    [self.navigationController pushViewController:[UserInfoViewController create] animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.bookArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BookListCell *cell = [tableView dequeueReusableCellWithIdentifier:BOOK_LIST_CELL_ID forIndexPath:indexPath];
    NSDictionary *dic = [self.bookArray objectAtIndex:indexPath.item];
    [cell updateWithAvatarImage:[dic objectForKey:@"fullImgUrl"] address:[dic objectForKey:@""] description:[dic objectForKey:@"orderName"] time:[dic objectForKey:@"arriveTime"] recivied:[[dic objectForKey:@"isOnSending"] boolValue]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [self.bookArray objectAtIndex:indexPath.item];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager GET:@"http://121.199.78.191:3000/orderMenu/receiveOrder" parameters:@{@"userId":[[[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"] objectForKey:@"id"], @"orderId":[dic objectForKey:@"orderId"]} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self.bookArray];
        [array removeObjectAtIndex:indexPath.row];
        self.bookArray = array;
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
    }];
    
}

@end
