//
//  HomeViewController.m
//  NewsApp
//
//  Created by Masker on 2019/4/21.
//  Copyright © 2019 Masker. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"Next" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextTaped) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)nextTaped {
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor yellowColor];
    vc.navigationItem.title = @"detail";
    
    [self.navigationController pushViewController:vc animated:YES];
}


@end
