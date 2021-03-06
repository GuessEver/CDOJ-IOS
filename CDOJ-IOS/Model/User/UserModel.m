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

- (void)fetchInfoData {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    [[AFHTTPSessionManager manager] GET:API_USER_INFO(self.username) parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            self.basicInfo = [responseObject objectForKey:@"user"];
            if([self.username isEqualToString:[LocalDataModel getDefaultUsername]]) { // renew userId
                NSLog(@"userId renewed: %@", [self.basicInfo objectForKey:@"userId"]);
                [LocalDataModel setDefaultUserId:[self.basicInfo objectForKey:@"userId"]];
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_USER_INFO_REFRESHED object:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}
- (void)fetchBasicData {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    [[AFHTTPSessionManager manager] GET:API_USER_PROFILE(self.username) parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            self.basicInfo = [responseObject objectForKey:@"user"];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_USER_BASIC_REFRESHED object:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}
- (void)fetchAchievementData {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    [[AFHTTPSessionManager manager] GET:API_USER_CENTERDATA(self.username) parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            self.achievementInfo = [responseObject objectForKey:@"problemStatus"];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_USER_ACHIEVEMENT_REFRESHED object:nil];
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
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
//            [LocalDataModel setDefaultUsername:[user objectForKey:@"username"]];
            NSMutableDictionary* newUser = [NSMutableDictionary dictionaryWithDictionary:user];
            [newUser setObject:[responseObject objectForKey:@"email"] forKey:@"email"];
            [LocalDataModel addUserWithUser:[NSDictionary dictionaryWithDictionary:newUser]];
            if([[user objectForKey:@"username"] isEqualToString:[LocalDataModel getDefaultUsername]]) {
                [UserModel renewDefaultUserId];
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_USER_SIGN_IN object:nil];
        }
        else {
            [self userLogout];
            [Message show:@"请到用户中心重新登录！" withTitle:@"登录失败"];
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
+ (void)userLoginWithDefaultUser {
    NSLog(@"default user login");
    NSDictionary* defaultUser = [LocalDataModel getDefaultUser];
    if(defaultUser != nil) {
        [UserModel userLoginWithUser:defaultUser];
    }
}
+ (void)renewDefaultUserId {
    UserModel* user = [[UserModel alloc] init];
    [user setUsername:[LocalDataModel getDefaultUsername]];
    [user fetchInfoData];
}

//////
+ (void)userRegisterWithData:(NSDictionary*)user {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager POST:API_USER_REGISTER parameters:user progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
//        NSLog(@"%@", responseObject);
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_USER_REGISTER_SUCCEED object:nil];
        }
        else {
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_USER_REGISTER_FAILED object:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}
+ (void)userModifyWithData:(NSDictionary*)user {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager POST:API_USER_MODIFY parameters:user progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
        NSLog(@"%@", responseObject);
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_USER_MODIFY_SUCCEED object:nil];
        }
        else {
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_USER_MODIFY_FAILED object:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}

@end
