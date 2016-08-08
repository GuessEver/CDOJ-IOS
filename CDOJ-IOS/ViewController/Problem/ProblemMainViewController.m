//
//  ProblemMainViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ProblemMainViewController.h"
#import "DefaultSplitDetailLogoViewController.h"
#import "ProblemSplitMasterViewController.h"

@implementation ProblemMainViewController

- (instancetype)init {
    if(self = [super init]) {
        ProblemSplitMasterViewController* A = [[ProblemSplitMasterViewController alloc] init];
        DefaultSplitDetailLogoViewController* B = [[DefaultSplitDetailLogoViewController alloc] init];
        [self setViewControllers:@[A, B]];
    }
    return self;
}

@end
