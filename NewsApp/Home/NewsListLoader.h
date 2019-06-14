//
// Created by Masker on 2019-06-09.
// Copyright (c) 2019 Masker. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NewsListLoader : NSObject

- (void)loadListDataWithBlock: (void (^)(bool success, NSArray *items))block;

@end