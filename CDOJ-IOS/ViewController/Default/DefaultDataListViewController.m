//
//  DefaultDataListViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/11.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultDataListViewController.h"

@interface DefaultDataListViewController ()

@end

@implementation DefaultDataListViewController

- (instancetype)initWithStyle:(UITableViewStyle)style {
    if(self = [super initWithStyle:style]) {
        // pull to refresh
        self.refreshHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshFirstPageData)];
        [self.refreshHeader.lastUpdatedTimeLabel setHidden:YES];
        self.tableView.mj_header = self.refreshHeader;
        
        self.refreshFooter = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshNextPageData)];
        self.tableView.mj_footer = self.refreshFooter;
        
    }
    return self;
}

#pragma mark override required functions
- (void)refreshFirstPageData {
}
- (void)refreshNextPageData {
}

@end
