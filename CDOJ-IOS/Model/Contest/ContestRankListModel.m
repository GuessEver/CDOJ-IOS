//
//  ContestRankListModel.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestRankListModel.h"

@implementation ContestRankListModel

- (instancetype)initWithContestId:(NSString*)contestId {
    if (self = [super init]) {
        self.requestUrl = API_CONTEST_RANKLIST(contestId);
    }
    return self;
}

- (void)fetchDataOnPage:(NSInteger)page {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    [[AFHTTPSessionManager manager] GET:self.requestUrl parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            [self.list addObjectsFromArray:[[responseObject objectForKey:@"rankList"] objectForKey:@"rankList"]];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CONTEST_RANKLIST_REFRESHED object:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}

@end
