//
//  TrainingRatingContentModel.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "TrainingRatingContentModel.h"

@implementation TrainingRatingContentModel

- (instancetype)initWithTrainingId:(NSString*)trainingId {
    if(self = [super init]) {
        self.trainingId = trainingId;
        self.basicInfo = @{};
        self.users = @[];
        self.contests = @[];
    }
    return self;
}

- (void)fetchBasicInfo { // {description, title, trainingId}
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    [[AFHTTPSessionManager manager] GET:API_TRAINING_INFO(self.trainingId) parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_TRAINING_INFO_REFRESHED object:nil];
            self.basicInfo = [responseObject objectForKey:@"trainingDto"];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}
- (void)fetchUsers { // [{competitions, currentRating, currentVolatility, maximumRating, minimumRating, mostRecentEventId, mostRecentEventName, rank, ratingHistoryList[{rank, rating, ratingVary, trainingContestId, volatility, volatilityVary}], trainingId, trainingUserId, trainingUserName, type, userId, userName}]
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    NSDictionary* requestBody = @{@"orderFields":@"rank,trainingUserName",@"orderAsc":@"true,true"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager POST:API_TRAINING_USER(self.trainingId) parameters:requestBody progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            self.users = [responseObject objectForKey:@"list"];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_TRAINING_USER_REFRESHED object:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}
- (void)fetchContests { // [{link, platformType, title, trainingContestId, trainingId, type}]
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTING object:nil];
    NSDictionary* requestBody = @{@"orderFields":@"trainingContestId",@"orderAsc":@"true"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [manager POST:API_TRAINING_CONTEST(self.trainingId) parameters:requestBody progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_CONNECTED object:nil];
        if([[responseObject objectForKey:@"result"] isEqualToString:@"success"]) {
            self.contests = [responseObject objectForKey:@"list"];
            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_TRAINING_CONTEST_REFRESHED object:nil];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_HTTP_ERROR object:nil];
    }];
}
@end
