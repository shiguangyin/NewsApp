//
// Created by Masker on 2019-05-11.
// Copyright (c) 2019 Masker. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "UIView+category.h"
#import "DislikeView.h"
#import "ListItem.h"
#import <SDWebImage/UIImageView+WebCache.h>

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
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 0, 0)];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
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
            self.contentImage;
        })];

//        [self.contentView addSubview:({
//            self.dislikeButton = [[UIButton alloc] init];
//            [self.dislikeButton setTitle:@"X" forState:UIControlStateNormal];
//            [self.dislikeButton addTarget:self action:@selector(clickDislike:) forControlEvents:UIControlEventTouchUpInside];
//            self.dislikeButton.backgroundColor = [UIColor redColor];
//            self.dislikeButton;
//        })];
    }

    return self;
}


- (void) clickDislike: (UIButton *) button {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:ClickDislikeButton:)]) {
        [self.delegate tableViewCell:self ClickDislikeButton:button];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat titleBottom = self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height;
    CGFloat width = 120;
    CGFloat height = 80;
    CGFloat x = self.contentView.width - width - 20;
    self.contentImage.frame = CGRectMake(x, 20, width, height);
    self.dislikeButton.frame = CGRectMake(self.contentView.width - 50, titleBottom + 50,
            30, 20);
    CGFloat titleWidth = x - 30;
    self.titleLabel.frame = CGRectMake(20, 20, titleWidth, 40);

    CGFloat bottomY = self.contentView.height - 30;
    self.sourceLabel.frame = CGRectMake(20, bottomY, self.sourceLabel.width, self.sourceLabel.height);
    self.commentLabel.frame = CGRectMake(self.sourceLabel.x + self.sourceLabel.width + 10, bottomY,
            self.commentLabel.width, self.commentLabel.height);
    self.timeLabel.frame = CGRectMake(self.commentLabel.x + self.commentLabel.width + 10, bottomY,
            self.timeLabel.width, self.timeLabel.height);


}


- (void)bindWith:(ListItem *)item {
    self.titleLabel.text = item.desc;
    [self.titleLabel sizeToFit];

    self.sourceLabel.text = item.source;
    [self.sourceLabel sizeToFit];


    self.commentLabel.text = item.type;
    [self.commentLabel sizeToFit];


    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSSZ";
    NSDate *date = [formatter dateFromString:item.publishedAt];
    if (date) {
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        self.timeLabel.text = [formatter stringFromDate:date];
    } else {
        self.timeLabel.text = @"Unknow";
    }
    [self.timeLabel sizeToFit];

    if (item.images && item.images.count > 0) {
        [self.contentImage sd_setImageWithURL:item.images[0] placeholderImage:[UIImage imageNamed:@"no_images"]];
    } else {
        self.contentImage.image = [UIImage imageNamed:@"no_images"];
    }

}


@end