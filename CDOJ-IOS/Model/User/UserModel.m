//
//  UserModel.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/16.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "UserModel.h"
#import "LocalDataModel.h"

@implementation UserModel

- (instancetype)init {
    if (self = [super init]) {
        self.basicInfo = [[NSDictionary alloc] init];
        self.achievementInfo = [[NSDictionary alloc] init];
    }
    return self;
}

- (void)fetchDataWithUsername:(NSString*)username {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    [[AFHTTPSessionManager manager] GET:API_USER_CENTERDATA(self.username) parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            self.basicInfo = [responseObject objectForKey:@"targetUser"];
            self.achievementInfo = [responseObject objectForKey:@"problemStatus"];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_USER_DATA_REFRESHED object:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}

+ (void)userLoginWithUser:(NSDictionary*)user {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager POST:API_USER_LOGIN parameters:user progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
//        NSLog(@"%@", responseObject);
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
//            [LocalDataModel setDefaultUsername:[user objectForKey:@"username"]];
            [LocalDataModel addUserWithUser:user];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_USER_SIGN_IN object:nil];
        }
        else {
            [self userLogout];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}
+ (void)userLogout {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    [[AFHTTPSessionManager manager] GET:API_USER_LOGOUT parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
//        NSLog(@"%@", responseObject);
        [LocalDataModel setDefaultUsername:@""];
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_USER_SIGN_OUT object:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}

@end
