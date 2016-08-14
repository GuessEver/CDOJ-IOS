//
//  RecentContestListModel.m
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "RecentContestListModel.h"

@implementation RecentContestListModel

- (instancetype)init {
    if(self = [super init]) {
        self.list = @[];
    }
    return self;
}

- (void)fetchList {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    [[AFHTTPSessionManager manager] GET:API_RECENTCONTEST parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
        self.list = [responseObject objectForKey:@"recentContestList"];
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_RECENTCONTEST_REFRESHED object:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}

@end
