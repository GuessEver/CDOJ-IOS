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
        self.keyword = @"";
        self.list = [[NSMutableArray alloc] init];
        self.pageInfo = [[NSDictionary alloc] init];
    }
    return self;
}

- (void)clearList {
    self.list = [[NSMutableArray alloc] init];
}

- (void)fetchDataOnPage:(NSInteger)page {
//    NSLog(@"fetching problem on page %ld with keyword %@", (long)page, self.keyword);
    NSDictionary* requestBody = @{@"currentPage":[NSString stringWithFormat:@"%ld", (long)page],@"orderFields":@"id",@"orderAsc":@"true",@"keyword":self.keyword};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager POST:API_PROBLEM_LIST parameters:requestBody progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            self.pageInfo = [responseObject objectForKey:@"pageInfo"];
            [self.list addObjectsFromArray:[responseObject objectForKey:@"list"]];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_PROBLEM_LIST_REFRESHED object:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}

@end
