//
//  HomeViewController.m
//  NewsApp
//
//  Created by Masker on 2019/4/21.
//  Copyright © 2019 Masker. All rights reserved.
//

#import "HomeViewController.h"
#import "NewsTableViewCell.h"
#import "DislikeView.h"
#import "NewsListLoader.h"
#import "ListItem.h"

@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate, NewsTableViewCellDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *data;

@property (strong, nonatomic) NewsListLoader *loader;

@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [[NSMutableArray alloc] init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    self.loader = [[NewsListLoader alloc] init];
    __weak typeof(self) weakSelf = self;
    [self.loader loadListDataWithBlock:^(bool success, NSArray *items) {
        __strong typeof(self) this = weakSelf;
        [this.data removeAllObjects];
        [this.data addObjectsFromArray:items];
        [this.tableView reloadData];
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _tableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"item"];
    if (!cell) {
        cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"item"];
    }
    cell.delegate = self;
    id item = self.data[indexPath.item];
    if ([item isKindOfClass:[ListItem class]]) {
        [cell bindWith:item];
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (void)tableViewCell:(UITableViewCell *)cell ClickDislikeButton:(UIButton *)button {
    DislikeView *dislikeView = [[DislikeView alloc] init];
    CGPoint point = [cell convertPoint:button.frame.origin toView:nil];
    __weak typeof(self) weakSelf = self;
    [dislikeView showFromPoint:point WithBlock:^{
        __strong typeof(self) strongSelf = weakSelf;
        NSIndexPath *indexPath = [strongSelf.tableView indexPathForCell:cell];
        [strongSelf.data removeObjectAtIndex:indexPath.item];
        [strongSelf.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];
    }];
}


@end
