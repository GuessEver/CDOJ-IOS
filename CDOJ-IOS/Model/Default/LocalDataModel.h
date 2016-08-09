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
+ (NSArray*)getAllLocalUsers;
+ (NSDictionary*)getUserAtIndex:(NSInteger)index;
+ (void)deleteUserByUsername:(NSString*)username;
+ (void)addUserWithUsername:(NSString*)username andPassword:(NSString*)password;

@end
