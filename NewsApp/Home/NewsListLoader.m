//
// Created by Masker on 2019-06-09.
// Copyright (c) 2019 Masker. All rights reserved.
//

#import "NewsListLoader.h"
#import "AFNetworking.h"


@implementation NewsListLoader

- (void)loadListData {
    NSString *url = @"http://gank.io/api/data/%E7%A6%8F%E5%88%A9/10/1";
    [[AFHTTPSessionManager manager] GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"data= %@", responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error = %@", error);
    }];

}

@end