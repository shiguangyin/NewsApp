//
// Created by Masker on 2019-05-28.
// Copyright (c) 2019 Masker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface DislikeView : UIView

- (void)showFromPoint: (CGPoint)point WithBlock: (dispatch_block_t) block;

- (void)dismiss;

@end