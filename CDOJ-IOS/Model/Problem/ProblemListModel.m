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
        self.list = [[NSMutableArray alloc] init];
        self.pageInfo = [[NSDictionary alloc] init];
    }
    return self;
}

- (void)fetchData:(NSInteger)page {
    NSDictionary* requestBody = @{@"currentPage":[NSString stringWithFormat:@"%ld", page],@"orderFields":@"id",@"orderAsc":@"true"};
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
    
    
    
    NSLog(@"%@", API_PROBLEM_LIST);
    requestBody = @{@"currentPage":@"1",@"orderFields":@"id",@"orderAsc":@"true"};
    manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager POST:@"http://acm.uestc.edu.cn/problem/search" parameters:requestBody progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", [error localizedDescription]);
    }];
    
}

@end
