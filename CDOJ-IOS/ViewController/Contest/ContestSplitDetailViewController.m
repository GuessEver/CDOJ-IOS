//
//  ContestSplitDetailViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestSplitDetailViewController.h"
#import "ContestContentViewController.h"

@implementation ContestSplitDetailViewController

- (instancetype)initWithContestId:(NSString*)cid {
    if(self = [super initWithRootViewController:[[ContestContentViewController alloc] initWithContestId:cid]]) {
    }
    return self;
}

@end
