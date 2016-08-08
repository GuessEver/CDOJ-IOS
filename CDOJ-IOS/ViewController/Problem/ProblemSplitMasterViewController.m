//
//  ProblemSplitMasterViewController.m
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ProblemSplitMasterViewController.h"
#import "ProblemListViewController.h"

@implementation ProblemSplitMasterViewController

- (instancetype)init {
    if(self = [super initWithRootViewController:[[ProblemListViewController alloc] init]]) {
    }
    return self;
}

@end
