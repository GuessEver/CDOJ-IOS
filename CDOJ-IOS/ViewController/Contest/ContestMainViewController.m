//
//  ContestMainViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestMainViewController.h"
#import "DefaultSplitDetailLogoViewController.h"
#import "ContestSplitMasterViewController.h"

@implementation ContestMainViewController

- (instancetype)init {
    if(self = [super init]) {
        ContestSplitMasterViewController* A = [[ContestSplitMasterViewController alloc] init];
        DefaultSplitDetailLogoViewController* B = [[DefaultSplitDetailLogoViewController alloc] init];
        [self setViewControllers:@[A, B]];
    }
    return self;
}

@end
