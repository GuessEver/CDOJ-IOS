//
//  LocalDataModel.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "LocalDataModel.h"

@implementation LocalDataModel

NSString* LocalDataKeyOpened = @"opened";
NSString* LocalDataKeyUsers = @"users";
NSString* LocalDataKeyDefaultUserIndex = @"defaultUserIndex";

+ (BOOL)needWelcome {
    if([[[NSUserDefaults standardUserDefaults] objectForKey:LocalDataKeyOpened] isEqualToString:@"yes"]) {
        return NO;
    }
    return YES;
}

+ (void)saveData:(id)data to:(NSString*)key {
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
}

+ (void)initLocalData {
    [self saveData:@"yes" to:LocalDataKeyUsers];
    [self saveData:@-1 to:LocalDataKeyDefaultUserIndex];
    [[NSUserDefaults standardUserDefaults] setObject:@[] forKey:LocalDataKeyUsers];
}


#pragma mark users {username, password(sha1)}
+ (NSArray*)getAllLocalUsers {
    return [[NSUserDefaults standardUserDefaults] objectForKey:LocalDataKeyUsers];
}
+ (NSDictionary*)getUserAtIndex:(NSInteger)index {
    return [self getAllLocalUsers][index];
}
+ (void)deleteUserByUsername:(NSString*)username {
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
    NSMutableArray* users = [NSMutableArray arrayWithArray:[self getAllLocalUsers]];
    [users addObject:@{@"username":username, @"password":password}];
    [self saveData:[NSArray arrayWithArray:users] to:LocalDataKeyUsers];
}

@end
