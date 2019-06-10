//
// Created by Masker on 2019-06-09.
// Copyright (c) 2019 Masker. All rights reserved.
//

#import <CloudKit/CloudKit.h>
#import "NewsListLoader.h"
#import "AFNetworking.h"
#import "YYModel.h"
#import "ListItem.h"


@implementation NewsListLoader

- (void)loadListData {
    NSString *url = @"http://gank.io/api/data/%E7%A6%8F%E5%88%A9/10/1";
    [[AFHTTPSessionManager manager] GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSArray * results = ((NSDictionary *) responseObject)[@"results"];
            NSMutableArray *listItems = [[NSMutableArray alloc] initWithCapacity:results.count];
            for (NSDictionary *dict in results) {
                ListItem *item = [ListItem yy_modelWithDictionary:dict];
                [listItems addObject:item];
            }
            NSLog(@"items = %@", listItems);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error = %@", error);
    }];

}

@end