//
//  LocalDataModel.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "LocalDataModel.h"
#import "UserModel.h"

@implementation LocalDataModel

NSString* LocalDataKeyOpened = @"opened";
NSString* LocalDataKeyUsers = @"users";
NSString* LocalDataKeyDefaultUsername = @"defaultUsername";

+ (BOOL)needWelcome {
    if([[[NSUserDefaults standardUserDefaults] objectForKey:LocalDataKeyOpened] isEqualToString:@"yes"]) {
        return NO;
    }
    return YES;
}

+ (void)saveData:(id)data to:(NSString*)key {
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)initLocalData {
    [self saveData:@"yes" to:LocalDataKeyOpened];
    [self saveData:@"" to:LocalDataKeyDefaultUsername];
    [[NSUserDefaults standardUserDefaults] setObject:@[] forKey:LocalDataKeyUsers];
}


#pragma mark users {username, password(sha1)}
+ (NSArray*)getAllLocalUsers {
    return [[NSUserDefaults standardUserDefaults] objectForKey:LocalDataKeyUsers];
}
+ (NSDictionary*)getUserAtIndex:(NSInteger)index {
    return [self getAllLocalUsers][index];
}
+ (NSDictionary*)getUserByUsername:(NSString*)username {
    NSArray* users = [self getAllLocalUsers];
    for(int i = 0; i < users.count; i++) {
        if([[users[i] objectForKey:@"username"] isEqualToString:username]) {
            return users[i];
        }
    }
    return nil;
}
+ (NSString*)getDefaultUsername {
    return [[NSUserDefaults standardUserDefaults] objectForKey:LocalDataKeyDefaultUsername];
}
+ (NSDictionary*)getDefaultUser {
    return [self getUserByUsername:[self getDefaultUsername]];
}
+ (void)deleteUserByUsername:(NSString*)username {
    if([[self getDefaultUsername] isEqualToString:username]) {
        [self saveData:@"" to:LocalDataKeyDefaultUsername];
    }
    NSMutableArray* users = [NSMutableArray arrayWithArray:[self getAllLocalUsers]];
    for(int i = 0; i < users.count; i++) {
        if([[users[i] objectForKey:@"username"] isEqualToString:username]) {
            [users removeObjectAtIndex:i];
            break; // no two user can have a same username
        }
    }
    [self saveData:[NSArray arrayWithArray:users] to:LocalDataKeyUsers];
}
+ (void)addUserWithUsername:(NSString*)username andPassword:(NSString*)password {
    [self deleteUserByUsername:username];
    NSMutableArray* users = [NSMutableArray arrayWithArray:[self getAllLocalUsers]];
    NSDictionary* newUser = @{@"username":username, @"password":password};
    [users addObject:newUser];
    [self saveData:[NSArray arrayWithArray:users] to:LocalDataKeyUsers];
//    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_USER_LIST_REFRESHED object:nil];
    [self saveData:username to:LocalDataKeyDefaultUsername];
    [UserModel userLoginWithUser:[self getUserByUsername:username]];
}
+ (void)setDefaultUsername:(NSString*)username {
    [self saveData:username to:LocalDataKeyDefaultUsername];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_USER_LIST_REFRESHED object:nil];
}

@end
