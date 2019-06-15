//
// Created by Masker on 2019-06-10.
// Copyright (c) 2019 Masker. All rights reserved.
//

#import "ListItem.h"


@implementation ListItem

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"images": [NSString class]
    };
}

@end