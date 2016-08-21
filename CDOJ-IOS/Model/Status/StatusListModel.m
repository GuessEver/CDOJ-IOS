//
//  StatusListModel.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/21.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "StatusListModel.h"

@implementation StatusListModel

- (instancetype)init {
    if (self = [super init]) {
        self.contestId = @"";
        self.userName = @"";
        self.problemId = @"";
    }
    return self;
}

- (instancetype)initWithProblemId:(NSString*)problemId {
    if(self = [self init]) {
        self.problemId = problemId;
    }
    return self;
}
- (instancetype)initWithContestId:(NSString*)contestId {
    if(self = [self init]) {
        self.contestId = contestId;
    }
    return self;
}

- (void)fetchDataOnPage:(NSInteger)page {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    NSDictionary* requestBody = @{@"currentPage"    : STRF(@"%ld", (long)page),
                                  @"orderFields"    : @"statusId",
                                  @"orderAsc"       : @"false",
                                  @"contestId"      : self.contestId,
                                  @"userName"       : self.userName,
                                  @"problemId"      : self.problemId
                                  };
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager POST:API_STATUS_LIST parameters:requestBody progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            self.hasData = YES;
            self.pageInfo = [responseObject objectForKey:@"pageInfo"];
            [self.list addObjectsFromArray:[responseObject objectForKey:@"list"]];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_STATUS_LIST_REFRESHED object:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}

@end
