//
//  UserModel.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/16.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (instancetype)init {
    if (self = [super init]) {
        self.basicInfo = [[NSDictionary alloc] init];
        self.achievementInfo = [[NSDictionary alloc] init];
    }
    return self;
}

- (void)fetchDataWithUserName:(NSString*)username {
    [[AFHTTPSessionManager manager] GET:API_USER_CENTERDATA(self.username) parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            self.basicInfo = [responseObject objectForKey:@"targetUser"];
            self.achievementInfo = [responseObject objectForKey:@"problemStatus"];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_USER_DATA_REFRESHED object:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}

@end
