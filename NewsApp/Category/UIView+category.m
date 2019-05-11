//
// Created by Masker on 2019-05-11.
// Copyright (c) 2019 Masker. All rights reserved.
//

#import "UIView+category.h"


@implementation UIView (category)


- (CGFloat)height {
    return self.frame.size.height;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

@end