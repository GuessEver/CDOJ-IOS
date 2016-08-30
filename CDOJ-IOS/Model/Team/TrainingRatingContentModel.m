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
        self.ratingSections = [NSMutableArray arrayWithArray:@[@0, @2200, @1500, @1200, @900]];
        self.colorSections = @[COLOR_RED, COLOR_YELLOW, COLOR_BLUE, COLOR_GREEN, COLOR_GRAY, COLOR_BLACK];
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

- (void)processGraphData {
    self.rating = [[NSMutableArray alloc] init];
    for(NSInteger lineIndex = 0; lineIndex < self.users.count; lineIndex++) {
        NSMutableArray<NSNumber*>* current = [[NSMutableArray alloc] init];
        for(NSInteger horizontalIndex = 0; horizontalIndex < self.contests.count; horizontalIndex++) {
            NSArray* history = [self.users[lineIndex] objectForKey:@"ratingHistoryList"];
            NSInteger trainingContestId = [[self.contests[horizontalIndex] objectForKey:@"trainingContestId"] integerValue];
            [current addObject:[NSNumber numberWithFloat:NAN]];
            for(NSInteger i = 0; i < history.count; i++) {
                if([[history[i] objectForKey:@"trainingContestId"] integerValue] == trainingContestId) {
//                    return [[history[i] objectForKey:@"rating"] floatValue];
                    current[horizontalIndex] = [history[i] objectForKey:@"rating"];
                    break;
                }
            }
        }
        [self.rating addObject:current];
    }
    
    self.ratingColor = [[NSMutableArray alloc] init];
    for(NSInteger lineIndex = 0; lineIndex < self.users.count; lineIndex++) {
        NSMutableArray<UIColor*>* current = [[NSMutableArray alloc] init];
        for(NSInteger horizontalIndex = 0; horizontalIndex < self.contests.count; horizontalIndex++) {
            [current addObject:self.colorSections[0]];
            for(NSInteger j = self.ratingSections.count - 1; j >= 0; j--) {
                if([self.rating[lineIndex][horizontalIndex] floatValue] < [self.ratingSections[j] floatValue]) {
                    current[horizontalIndex] = self.colorSections[j];
                    break;
                }
            }
        }
        [self.ratingColor addObject:current];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_TRAINING_GRAPH_REFRESHED object:nil];
}

@end
