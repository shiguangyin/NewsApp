//
// Created by Masker on 2019-05-11.
// Copyright (c) 2019 Masker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol NewsTableViewCellDelegate <NSObject>

- (void)tableViewCell:(UITableViewCell *)cell ClickDislikeButton: (UIButton *)button;

@end


@interface NewsTableViewCell : UITableViewCell

@property (weak, nonatomic) id<NewsTableViewCellDelegate> delegate;


-(void)bindData;

@end