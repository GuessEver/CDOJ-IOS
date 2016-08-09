//
//  UserMainViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "UserMainViewController.h"
#import "DefaultSplitDetailLogoViewController.h"
#import "UserSplitMasterViewController.h"

@implementation UserMainViewController

- (instancetype)init {
    if(self = [super init]) {
        UserSplitMasterViewController* A = [[UserSplitMasterViewController alloc] init];
        DefaultSplitDetailLogoViewController* B = [[DefaultSplitDetailLogoViewController alloc] init];
        [self setViewControllers:@[A, B]];
    }
    return self;
}

@end
