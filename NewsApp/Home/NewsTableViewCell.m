//
// Created by Masker on 2019-05-11.
// Copyright (c) 2019 Masker. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "UIView+category.h"

@interface NewsTableViewCell()

@property (strong, nonatomic) UILabel *titleLabel;

@property (strong, nonatomic) UILabel *sourceLabel;

@property (strong, nonatomic) UILabel *commentLabel;

@property (strong, nonatomic) UILabel *timeLabel;

@property (strong, nonatomic) UIImageView *contentImage;

@property (strong, nonatomic) UIButton *dislikeButton;

@end


@implementation NewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 0, 0)];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel;
        })];

        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] init];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel.font = [UIFont systemFontOfSize:14];
            self.sourceLabel;
        })];

        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] init];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel.font = [UIFont systemFontOfSize:14];
            self.commentLabel;
        })];

        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] init];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel.font = [UIFont systemFontOfSize:14];
            self.timeLabel;
        })];

        [self.contentView addSubview:({
            self.contentImage = [[UIImageView alloc] init];
            self.contentImage.backgroundColor = [UIColor redColor];
            self.contentImage;
        })];

        [self.contentView addSubview:({
            self.dislikeButton = [[UIButton alloc] init];
            [self.dislikeButton setTitle:@"X" forState:UIControlStateNormal];
            [self.dislikeButton addTarget:self action:@selector(clickDislike:) forControlEvents:UIControlEventTouchUpInside];
            self.dislikeButton.backgroundColor = [UIColor redColor];
            self.dislikeButton;
        })];
    }

    return self;
}


- (void) clickDislike: (UIButton *) button {
    NSLog(@"button = %@", button);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat titleBottom = self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height;
    CGFloat width = 100;
    CGFloat height = 60;
    CGFloat x = self.contentView.width - width - 20;
    self.contentImage.frame = CGRectMake(x, 20, width, height);
    self.dislikeButton.frame = CGRectMake(self.contentView.width - 40, titleBottom + 50,
            20, 20);
}


- (void)bindData {
    self.titleLabel.text = @"News title";
    [self.titleLabel sizeToFit];

    CGFloat titleBottom = self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height;


    self.sourceLabel.text = @"Source";
    [self.sourceLabel sizeToFit];
    self.sourceLabel.frame = CGRectMake(20, titleBottom + 50, self.sourceLabel.width, self.sourceLabel.height);

    uint32_t commentCount = arc4random() % 1000;


    if (commentCount > 1 ) {
        self.commentLabel.text = [NSString stringWithFormat:@"%dcomments", commentCount];
    } else {
        self.commentLabel.text = [NSString stringWithFormat:@"%dcomment", commentCount];
    }


    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.x + self.sourceLabel.width + 10, titleBottom + 50,
            self.commentLabel.width, self.commentLabel.height);

    self.timeLabel.text = @"Time";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.x + self.commentLabel.width + 10, titleBottom + 50,
            self.titleLabel.width, self.titleLabel.height);


}


@end