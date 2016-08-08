//
//  ContestDetailModal.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/28.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestDetailModal.h"

@implementation ContestDetailModal

- (instancetype)init {
    if (self = [super init]) {
        self.detail = [[NSDictionary alloc] init];
    }
    return self;
}

- (void)fetchDataWithContestId:(NSString *)cid {
    [[AFHTTPSessionManager manager] GET:API_CONTEST_DATA(cid) parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            self.detail = [responseObject objectForKey:@"contest"];
            self.problems = [responseObject objectForKey:@"problemList"];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CONTEST_DATA_REFRESHED object:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}

@end
