//
//  NoticeSplitMasterViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "NoticeSplitMasterViewController.h"
#import "NoticeListViewController.h"

@implementation NoticeSplitMasterViewController

- (instancetype)init {
    if(self = [super initWithRootViewController:[[NoticeListViewController alloc] init]]) {
    }
    return self;
}

@end
