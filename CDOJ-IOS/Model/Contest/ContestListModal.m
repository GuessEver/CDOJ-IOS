//
//  ContestListModal.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/28.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestListModal.h"

@implementation ContestListModal

- (instancetype)init {
    if (self = [super init]) {
        self.list = [[NSMutableArray alloc] init];
        self.pageInfo = [[NSDictionary alloc] init];
    }
    return self;
}

- (void)fetchData:(NSInteger)page {
    NSDictionary* requestBody = @{@"currentPage":[NSString stringWithFormat:@"%ld", page],@"orderFields":@"time",@"orderAsc":@"false"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager POST:API_CONTEST_LIST parameters:requestBody progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            self.pageInfo = [responseObject objectForKey:@"pageInfo"];
            [self.list addObjectsFromArray:[responseObject objectForKey:@"list"]];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CONTEST_LIST_REFRESHED object:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}

@end
