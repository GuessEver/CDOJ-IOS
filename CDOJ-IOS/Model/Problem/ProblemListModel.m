//
//  ProblemListModel.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/16.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ProblemListModel.h"

@implementation ProblemListModel

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)fetchDataOnPage:(NSInteger)page {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
//    NSLog(@"fetching problem on page %ld with keyword %@", (long)page, self.keyword);
    NSDictionary* requestBody = @{@"currentPage":[NSString stringWithFormat:@"%ld", (long)page],@"orderFields":@"id",@"orderAsc":@"true",@"keyword":self.keyword};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager POST:API_PROBLEM_LIST parameters:requestBody progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            self.hasData = YES;
            self.pageInfo = [responseObject objectForKey:@"pageInfo"];
            [self.list addObjectsFromArray:[responseObject objectForKey:@"list"]];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_PROBLEM_LIST_REFRESHED object:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}

@end
