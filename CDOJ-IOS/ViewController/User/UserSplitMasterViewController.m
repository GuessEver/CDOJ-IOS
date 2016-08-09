//
//  UserSplitMasterViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "UserSplitMasterViewController.h"
#import "UserSettingViewController.h"

@implementation UserSplitMasterViewController

- (instancetype)init {
    if(self = [super initWithRootViewController:[[UserSettingViewController alloc] init]]) {
    }
    return self;
}

@end
