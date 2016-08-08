//
//  NoticeMainViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "NoticeMainViewController.h"
#import "DefaultSplitDetailLogoViewController.h"
#import "NoticeSplitMasterViewController.h"

@implementation NoticeMainViewController

- (instancetype)init {
    if(self = [super init]) {
        NoticeSplitMasterViewController* A = [[NoticeSplitMasterViewController alloc] init];
        DefaultSplitDetailLogoViewController* B = [[DefaultSplitDetailLogoViewController alloc] init];
        [self setViewControllers:@[A, B]];
    }
    return self;
}

@end
