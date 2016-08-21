//
//  LocalDataModel.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultModel.h"

@interface LocalDataModel : DefaultModel

+ (BOOL)needWelcome;
+ (void)initLocalData;

+ (NSInteger)getDefaultThemeIndex;
+ (void)setDefaultThemeIndex:(NSInteger)index;

+ (NSArray<NSDictionary*>*)getAllLocalUsers;
+ (NSDictionary*)getUserAtIndex:(NSInteger)index;
+ (NSDictionary*)getUserByUsername:(NSString*)username;
+ (NSString*)getDefaultUsername;
+ (NSDictionary*)getDefaultUser;
+ (void)deleteUserByUsername:(NSString*)username;
+ (void)addUserWithUser:(NSDictionary*)newUser;
+ (void)setDefaultUsername:(NSString*)username;

+ (void)setCurrentProblem:(NSString*)problemId;
+ (void)setCurrentProblem:(NSString*)problemId inContest:(NSString*)contestId withOrderCharacter:(NSString*)orderCharacter;
+ (NSDictionary*)getCurrentProblemAndContest;

@end
