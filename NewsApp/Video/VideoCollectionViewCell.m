//
// Created by Masker on 2019-07-06.
// Copyright (c) 2019 Masker. All rights reserved.
//

#import "VideoCollectionViewCell.h"
#import "UIView+category.h"
#import "SDWebImage/UIImageView+WebCache.h"


@interface VideoCollectionViewCell()

@property (nonatomic, strong) UIImageView *imageCover;

@property (nonatomic, strong) UIImageView *imagePlay;

@end


@implementation VideoCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:({
            CGRect frame = CGRectMake(0, 0, self.contentView.width, self.contentView.height);
            self.imageCover = [[UIImageView alloc] initWithFrame: frame];
            self.imageCover.backgroundColor = [UIColor lightGrayColor];
            self.imageCover;
        })];
        [self.contentView addSubview:({
            self.imagePlay = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
            self.imagePlay.center = self.imageCover.center;
            self.imagePlay.image = [UIImage imageNamed:@"icon.bundle/play.png"];
            self.imagePlay;
        })];
    }

    return self;
}


- (void)bindData {
    NSString *coverUrl = @"http://img.kaiyanapp.com/290d3c61036379fa0cdab35228965bc6.jpeg?imageMogr2/quality/60/format/jpg";
    NSString *videoUrl = @"http://baobab.kaiyanapp.com/api/v1/playUrl?vid=165714&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss";
    [self.imageCover sd_setImageWithURL:coverUrl];

}


@end