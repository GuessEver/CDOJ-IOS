//
//  UserModel.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/16.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DefaultModel.h"

@interface UserModel : DefaultModel

@property (nonatomic, strong) NSString* username;
@property (nonatomic, strong) NSDictionary* basicInfo;
@property (nonatomic, strong) NSDictionary* achievementInfo;

- (void)fetchInfoData;
- (void)fetchBasicData;
- (void)fetchAchievementData;
+ (void)userLoginWithUser:(NSDictionary*)user;
+ (void)userLoginWithDefaultUser;
+ (void)userRegisterWithData:(NSDictionary*)user;
+ (void)userModifyWithData:(NSDictionary*)user;

@end
