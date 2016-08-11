//
//  ContestDetailModal.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/28.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestContentModel.h"
#import "UserModel.h"
#import "LocalDataModel.h"

@implementation ContestContentModel

- (instancetype)init {
    if (self = [super init]) {
        self.detail = [[NSDictionary alloc] init];
    }
    return self;
}

+ (void)loginContestWithContestId:(NSString*)cid andPassword:(NSString*)password inType:(NSInteger)type {
    [UserModel userLoginWithUser:[LocalDataModel getDefaultUser]];
    // type can only be 1 - Private, 3 - Invited, 5 - Onsite
    NSDictionary* requestBody = @{@"contestId":cid,@"password":password};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager POST:API_CONTEST_LOGIN parameters:requestBody progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject:\n%@", responseObject);
        NSMutableDictionary* userInfo = [NSMutableDictionary dictionaryWithDictionary:@{@"cid":cid, @"type":[NSNumber numberWithInteger:type]}];
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CONTEST_LOGIN_SUCCEED object:nil userInfo:userInfo];
        }
        else if([[responseObject objectForKey:@"result"] isEqualToString:@"error"]) {
            // 5 - Onsite
            // or when not login
            [userInfo setObject:[responseObject objectForKey:@"error_msg"] forKey:@"errorMessage"];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CONTEST_LOGIN_NEED_PERMISSION object:nil userInfo:userInfo];
        }
        else {
            if(type == 1) { // Private
                [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CONTEST_LOGIN_NEED_PASSWORD object:nil userInfo:userInfo];
            }
            else { // 3 - Invited
                [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CONTEST_LOGIN_NEED_REGISTER object:nil userInfo:userInfo];
            }
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
