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
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshList) name:NOTIFICATION_HTTP_ERROR object:nil];
    }
    return self;
}

- (void)refreshFirstPageData {
    [self.data clearList];
    [self.data fetchDataOnPage:1];
}
- (BOOL)fetchNextPage {
    NSInteger page = [[self.data.pageInfo objectForKey:@"currentPage"] integerValue] + 1;
    NSInteger totalPages = [[self.data.pageInfo objectForKey:@"totalPages"] integerValue];
    if(page > totalPages) return NO;
    //    NSLog(@"Now fetching notice at page:%ld\n", page);
    [self.data fetchDataOnPage:page];
    return YES;
}
- (void)refreshNextPageData {
    if(self.data.hasData == NO) {
        [self refreshFirstPageData];
    }
    else if(![self fetchNextPage]) {
        [self.refreshFooter endRefreshing];
    }
}
- (void)refreshList {
    //    NSLog(@"%@", self.data.pageInfo);
    //    NSLog(@"%@", self.data.list);
    [self.tableView reloadData];
    [self.refreshHeader endRefreshing];
    [self.refreshFooter endRefreshing];
}

@end
