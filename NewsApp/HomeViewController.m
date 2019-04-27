//
//  HomeViewController.m
//  NewsApp
//
//  Created by Masker on 2019/4/21.
//  Copyright © 2019 Masker. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController () <UITableViewDataSource>


@property(strong, nonatomic) UITableView *tableView;

@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"item"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"item"];
    }
    NSUInteger index = [indexPath indexAtPosition:indexPath.length - 1];
    cell.textLabel.text = [NSString stringWithFormat:@"title %lu", index];
    cell.detailTextLabel.text = @"detail text";
    cell.imageView.image = [UIImage imageNamed:@"icon.bundle/home.png"];
    return cell;
}


@end
