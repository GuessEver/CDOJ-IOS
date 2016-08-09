//
//  ContestSplitMasterViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestSplitMasterViewController.h"
#import "ContestListViewController.h"

@implementation ContestSplitMasterViewController

- (instancetype)init {
    if(self = [super initWithRootViewController:[[ContestListViewController alloc] init]]) {
    }
    return self;
}

@end
