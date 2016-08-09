//
//  ContestListViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestListViewController.h"
#import "ContestListTableViewCell.h"
#import "ContestSplitDetailViewController.h"
#import "Time.h"

@implementation ContestListViewController

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        [self setTitle:@"比赛"];
        self.data = [[ContestListModel alloc] init];
        [self.data fetchDataOnPage:1];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshList) name:NOTIFICATION_CONTEST_LIST_REFRESHED object:nil];
    }
    return self;
}

- (void)refreshList {
    //    NSLog(@"%@", self.data.pageInfo);
    //    NSLog(@"%@", self.data.list);
    [self.tableView reloadData];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [ContestListTableViewCell height];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(![[self.data.list[indexPath.row] objectForKey:@"type"] isEqual:@0]) {
        NSLog(@"%@", [self.data.list[indexPath.row] objectForKey:@"typeName"]);
    }
    ContestSplitDetailViewController* detailView = [[ContestSplitDetailViewController alloc] initWithContestId:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"contestId"]]];
    [self.splitViewController showDetailViewController:detailView sender:nil];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContestListTableViewCell* cell = [[ContestListTableViewCell alloc] init];
    [cell.cid setText:[NSString stringWithFormat:@"#%@", [self.data.list[indexPath.row] objectForKey:@"contestId"]]];
    [cell.title setText:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"title"]]];
    [cell.startTime setText:getTimeString([NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"time"]])];
    [cell.length setText:getTimeLengthString2([NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"length"]])];
    [cell.status setText:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"status"]]];
    [cell.typeName setText:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"typeName"]]];
    [cell refreshTagColor];
    return cell;
}

@end
