//
// Created by Masker on 2019-05-28.
// Copyright (c) 2019 Masker. All rights reserved.
//

#import "DislikeView.h"
#import "UIView+category.h"


@interface DislikeView()


@property (strong, nonatomic) UIView *backgroundView;

@property (strong, nonatomic) UIButton *dislikeButton;

@property (strong, nonatomic) dispatch_block_t dislikeBlock;

@end


@implementation DislikeView


- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = [[UIScreen mainScreen] bounds];
        [self addSubview:({
            self.backgroundView = [[UIView alloc] initWithFrame:self.frame];
            self.backgroundView.backgroundColor = [UIColor blackColor];
            self.backgroundView.alpha = 0.5;
            UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] init];
            [tapGestureRecognizer addTarget:self action:@selector(clickBackground)];
            [self.backgroundView addGestureRecognizer:tapGestureRecognizer];
            self.backgroundView;
        })];

        [self addSubview:({
            self.dislikeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            self.dislikeButton.backgroundColor = [UIColor blueColor];
            [self.dislikeButton addTarget:self action:@selector(clickDislike) forControlEvents:UIControlEventTouchUpInside];
            self.dislikeButton;
        })];

    }

    return self;
}

- (void)clickBackground {
    [self dismiss];
}


- (void)clickDislike {
    if (self.dislikeBlock) {
        self.dislikeBlock();
    }
}

- (void)showFromPoint: (CGPoint )point WithBlock: (dispatch_block_t) block{
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    self.dislikeButton.frame = CGRectMake(point.x, point.y, 0, 0);
    self.dislikeBlock = [block copy];
    [UIView animateWithDuration:0.5f delay:0 usingSpringWithDamping:0.5f initialSpringVelocity:0.5f options:UIViewAnimationCurveEaseInOut animations:^{
        self.dislikeButton.frame = CGRectMake((self.width - 200)/ 2, (self.height - 200) / 2, 200, 200);
    } completion:^(BOOL finished) {
        NSLog(@"Anim finish");
    }];
}

- (void)dismiss {
    [self removeFromSuperview];
}


@end