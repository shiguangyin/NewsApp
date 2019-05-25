//
// Created by Masker on 2019-05-25.
// Copyright (c) 2019 Masker. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "DetailViewController.h"
#import "UIView+category.h"
#import "FBKVOController.h"


@interface DetailViewController()


@property (strong, nonatomic) WKWebView *webView;

@property (strong, nonatomic) FBKVOController *fbkvoController;

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

    self.fbkvoController = [FBKVOController controllerWithObserver:self];
    [self.fbkvoController observe:self.webView keyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
        id progress = change[NSKeyValueChangeNewKey];
        NSLog(@"new progress = %@", progress);
    }];

}


@end