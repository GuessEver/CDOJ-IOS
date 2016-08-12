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
#import "Masonry.h"

@implementation ProblemListViewController

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        [self setTitle:@"题库"];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"#" style:UIBarButtonItemStyleDone target:self action:@selector(skipProblem)];
        self.data = [[ProblemListModel alloc] init];
        [self loadLeftNavigationItems];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshList) name:NOTIFICATION_PROBLEM_LIST_REFRESHED object:nil];
        [self.tableView.mj_header beginRefreshing];
    }
    return self;
}

- (void)showProblemWithProblemId:(NSString*)pid {
    ProblemSplitDetailViewController* detailView = [[ProblemSplitDetailViewController alloc] initWithProblemId:pid];
    [self.splitViewController showDetailViewController:detailView sender:nil];
}
- (void)skipProblem {
    [Message showInputBoxWithPassword:NO message:@"请输入题目编号" title:@"跳转" callback:^(NSString *text) {
        [self showProblemWithProblemId:text];
    }];
}

- (void)loadLeftNavigationItems {
    if([self.data.keyword isEqualToString:@""]) {
        self.navigationItem.leftBarButtonItems = @[
                                                   [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(inputSearchKeyword)]
                                                   ];
    }
    else {
        self.navigationItem.leftBarButtonItems = @[
                                                   [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(inputSearchKeyword)],
                                                   [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(clearSearchKeyword)]
                                                   ];
    }
}
- (void)clearSearchKeyword {
    [self setTitle:@"题库"];
    [self.data setKeyword:@""];
    [self searchProblemList];
}
- (void)inputSearchKeyword {
    [Message showInputBoxWithPassword:NO message:@"请输入搜索关键字" title:@"搜索" callback:^(NSString *text) {
        [self.data setKeyword:text];
        if([text isEqualToString:@""]) {
            [self clearSearchKeyword];
        }
        else {
            [self setTitle:[NSString stringWithFormat:@"搜索：%@", text]];
            [self searchProblemList];
        }
    }];
}
- (void)searchProblemList {
    [self loadLeftNavigationItems];
    [self.data clearList];
    [self.data fetchDataOnPage:1];
}

#pragma mark UISearchBarDelegate

#pragma mark UISearchResultsUpdating

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [ProblemListTableViewCell height];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self showProblemWithProblemId:[NSString stringWithFormat:@"%@", [self.data.list[indexPath.row] objectForKey:@"problemId"]]];
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
