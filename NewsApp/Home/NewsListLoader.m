//
// Created by Masker on 2019-06-09.
// Copyright (c) 2019 Masker. All rights reserved.
//

#import "NewsListLoader.h"


@implementation NewsListLoader

- (void)loadListData {
    NSURL *url = [NSURL URLWithString:@"http://gank.io/api/today"];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString *resp = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"res = %@", resp);
    }];
    [task resume];

}

@end