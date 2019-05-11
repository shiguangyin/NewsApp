//
// Created by Masker on 2019-05-11.
// Copyright (c) 2019 Masker. All rights reserved.
//

#import "MineViewController.h"


@interface MineViewController() <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;

@end


@implementation MineViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected"];
        self.view.backgroundColor = [UIColor whiteColor];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];

    CGFloat viewWidth = self.view.bounds.size.width;
    CGFloat viewHeight = self.view.bounds.size.height;
    NSArray *colors = @[[UIColor redColor], [UIColor yellowColor], [UIColor blueColor]];
    int pageCount = 6;
    for (int i = 0; i < pageCount; ++i) {
        CGRect frame = CGRectMake(viewWidth * i, 0, viewWidth, viewHeight);
        UIView *view = [[UIView alloc] initWithFrame:frame];
        view.backgroundColor = colors[i % colors.count];
        [self.scrollView addSubview:view];
    }
    self.scrollView.contentSize = CGSizeMake(viewWidth * pageCount, viewHeight);
    self.scrollView.pagingEnabled = YES;
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"dis scroll offset x = %lf", scrollView.contentOffset.x);
}


- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"will begin decelerating");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"did end decelerating");
}


@end