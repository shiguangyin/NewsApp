//
// Created by Masker on 2019-05-25.
// Copyright (c) 2019 Masker. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "DetailViewController.h"
#import "UIView+category.h"


@interface DetailViewController()


@property (strong, nonatomic) WKWebView *webView;

@end


@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:({
        CGRect frame = CGRectMake(0, 0, self.view.width, self.view.height);
        self.webView = [[WKWebView alloc] initWithFrame: frame];
        self.webView;
    })];

    NSString *url = @"https://github.com";
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
    self.title = url;
    
}


@end