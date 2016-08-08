//
//  ProblemSplitDetailViewController.m
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ProblemSplitDetailViewController.h"
#import "ProblemContentViewController.h"

@implementation ProblemSplitDetailViewController

- (instancetype)initWithProblemId:(NSString*)pid {
    if(self = [super initWithRootViewController:[[ProblemContentViewController alloc] initWithProblemId:pid]]) {
    }
    return self;
}

@end
