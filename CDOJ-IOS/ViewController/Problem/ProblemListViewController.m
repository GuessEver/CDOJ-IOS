//
//  ProblemListViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ProblemListViewController.h"
#import "ProblemListTableViewCell.h"
#import "ProblemSplitDetailViewController.h"

@implementation ProblemListViewController

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        [self setTitle:@"题库"];
        self.data = [[ProblemListModel alloc] init];
        [self.data fetchDataOnPage:1];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshList) name:NOTIFICATION_PROBLEM_LIST_REFRESHED object:nil];
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
    return [ProblemListTableViewCell height];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ProblemSplitDetailViewController* detailView = [[ProblemSplitDetailViewController alloc] initWithProblemId:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"problemId"]]];
    [self.splitViewController showDetailViewController:detailView sender:nil];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProblemListTableViewCell* cell = [[ProblemListTableViewCell alloc] init];
    [cell.pid setText:[NSString stringWithFormat:@"#%@", [self.data.list[indexPath.row] objectForKey:@"problemId"]]];
    [cell.title setText:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"title"]]];
    [cell.source setText:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"source"]]];
    [cell.statistics setText:[NSString stringWithFormat:@"solved/tried:%@/%@", [self.data.list[indexPath.row] objectForKey:@"solved"], [NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"tried"]]]];
    return cell;
}

@end
