//
//  DefaultModel.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/16.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultModel.h"
#import "UserModel.h"
#import "LocalDataModel.h"
#import "Message.h"

@implementation DefaultModel

- (instancetype)init
{
    if (self = [super init]) {
        [UserModel userLoginWithUser:[LocalDataModel getDefaultUser]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userSignout) name:NOTIFICATION_USER_SIGN_OUT object:nil];
    }
    return self;
}
- (void)userSignout {
//    [Message show:@"用户已登出，请到用户中心重新登录" withTitle:@"Oops!"];
}

@end
