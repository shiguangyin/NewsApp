//
// Created by Masker on 2019-05-25.
// Copyright (c) 2019 Masker. All rights reserved.
//

#import <WebKit/WebKit.h>
#import <KVOController/KVOController.h>
#import "DetailViewController.h"
#import "UIView+category.h"


@interface DetailViewController()

@property (strong, nonatomic) UIProgressView *progressView;


@property (strong, nonatomic) WKWebView *webView;


@end


@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat top = self.navigationController.navigationBar.height + self.navigationController.navigationBar.y;

    [self.view addSubview:({
        CGRect frame = CGRectMake(0, top, self.view.width, self.view.height - top);
        self.webView = [[WKWebView alloc] initWithFrame: frame];
        self.webView;
    })];
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, top, self.view.width, 0)];
        self.progressView;
    })];


    NSString *url = @"https://github.com";
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
    self.title = url;

    [self.KVOController observe:self.webView keyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
        self.progressView.progress = (float) self.webView.estimatedProgress;
        if (self.progressView.progress > 0.99f) {
            self.progressView.hidden = YES;
        }
    }];

}


@end