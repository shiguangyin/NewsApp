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

@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate, NewsTableViewCellDelegate>


@property(strong, nonatomic) UITableView *tableView;

@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _tableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"item"];
    if (!cell) {
        cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"item"];
    }
    cell.delegate = self;
    [cell bindData];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (void)tableViewCell:(UITableViewCell *)cell ClickDislikeButton:(UIButton *)button {
    DislikeView *dislikeView = [[DislikeView alloc] init];
    CGPoint point = [cell convertPoint: button.frame.origin toView:nil];
    [dislikeView showFromPoint:point WithBlock:^{
        NSLog(@"Dislike clicked");
    }];
}


@end
