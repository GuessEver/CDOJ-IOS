//
//  RecentContestListViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "RecentContestListViewController.h"
#import "RecentContestListTableViewCell.h"
#import "Time.h"

@implementation RecentContestListViewController

- (instancetype)init {
    if(self = [super init]) {
        self.data = [[RecentContestListModel alloc] init];
        [self.data fetchList];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:NOTIFICATION_RECENTCONTEST_REFRESHED object:nil];
        self.navigationItem.rightBarButtonItems = @[
                                                    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self.data action:@selector(fetchList)]
                                                    ];
    }
    return self;
}

- (void)reloadData {
    [self.tableView reloadData];
}

#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecentContestListTableViewCell* cell = [[RecentContestListTableViewCell alloc] init];
    [cell setLink:[self.data.list[indexPath.row] objectForKey:@"link"]];
    [cell.name setText:[self.data.list[indexPath.row] objectForKey:@"name"]];
    [cell.startTime setText:getTimeString([self.data.list[indexPath.row] objectForKey:@"start_time"])];
    [cell.oj setText:[self.data.list[indexPath.row] objectForKey:@"oj"]];
    [cell.dayOfWeek setText:[self.data.list[indexPath.row] objectForKey:@"week"]];
    [cell.access setText:[self.data.list[indexPath.row] objectForKey:@"access"]];
    [cell refreshTagColor];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.list.count;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [RecentContestListTableViewCell height];
}

@end
