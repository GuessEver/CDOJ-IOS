//
//  ContestDetailModal.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/28.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestContentModel.h"

@implementation ContestContentModel

- (instancetype)init {
    if (self = [super init]) {
        self.detail = [[NSDictionary alloc] init];
    }
    return self;
}

- (void)loginContestWithContestId:(NSString*)cid {
    NSDictionary* requestBody = @{@"contestId":cid,@"password":@"1234567890123456789012345678901234567890"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager POST:API_CONTEST_LOGIN parameters:requestBody progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject:\n%@", responseObject);
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
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
