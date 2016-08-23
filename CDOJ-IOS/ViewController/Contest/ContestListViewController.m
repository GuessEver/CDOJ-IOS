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
#import "ContestContentModel.h"
#import "Time.h"
#import "ContestRegisterViewController.h"

@implementation ContestListViewController

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        [self setTitle:@"比赛"];
        self.data = [[ContestListModel alloc] init];
        [self loadLeftNavigationItems];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshList) name:NOTIFICATION_CONTEST_LIST_REFRESHED object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contestLoginSucceed:) name:NOTIFICATION_CONTEST_LOGIN_SUCCEED object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contestLoginNeedPassword:) name:NOTIFICATION_CONTEST_LOGIN_NEED_PASSWORD object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contestLoginNeedRegister:) name:NOTIFICATION_CONTEST_LOGIN_NEED_REGISTER object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contestLoginNeedPermission:) name:NOTIFICATION_CONTEST_LOGIN_NEED_PERMISSION object:nil];
        [self.tableView.mj_header beginRefreshing];
        
        // skip in app
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changePage:) name:NOTIFICATION_SKIP_CONTEST object:nil];
    }
    return self;
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

- (void)changePage:(NSNotification*)sender {
    if([[sender.userInfo objectForKey:@"action"] isEqualToString:@"register"]) {
        ContestRegisterViewController* root = [[ContestRegisterViewController alloc] initWithContestId:STR([sender.userInfo objectForKey:@"contestId"])];
        [self presentViewController:[[DefaultNavigationController alloc] initWithCancelButtonOnLeftAndRootViewController:root] animated:YES completion:nil];
    }
}

- (void)clearSearchKeyword {
    [self setTitle:@"比赛"];
    [self.data setKeyword:@""];
    [self searchContestList];
}
- (void)inputSearchKeyword {
    [Message showInputBoxWithPassword:NO message:@"请输入搜索关键字" title:@"搜索" callback:^(NSString *text) {
        [self.data setKeyword:text];
        if([text isEqualToString:@""]) {
            [self clearSearchKeyword];
        }
        else {
            [self setTitle:STRF(@"搜索：%@", text)];
            [self searchContestList];
        }
    }];
}
- (void)searchContestList {
    [self loadLeftNavigationItems];
    [self.data clearList];
    [self.data fetchDataOnPage:1];
}

- (void)loadContest:(NSString*)contestId {
    ContestSplitDetailViewController* detailView = [[ContestSplitDetailViewController alloc] initWithContestId:contestId];
    [self.splitViewController showDetailViewController:detailView sender:nil];
}
- (void)enterContest:(NSString*)contestId withType:(NSInteger)type {
    if(type == 2 || type == 4) { // 2 - DIY, 4 - Inherit
        [Message show:STRF(@"Type-%ld of contest-%@ cannot be found!", (long)type, contestId) withTitle:@"Error!"];
    }
    else if(type == 0) { // Public
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_CONTEST_LOGIN_SUCCEED object:nil userInfo:@{@"contestId":contestId}];
    }
    else { // 1 - Private, 3 - Invited, 5 - Onsite
        [ContestContentModel loginContestWithContestId:contestId andPassword:sha1(@"") inType:type];
    }
}
- (void)contestLoginSucceed:(NSNotification*)contest {
    NSLog(@"Now going to contest %@", contest.userInfo);
    [self loadContest:[contest.userInfo objectForKey:@"contestId"]];
}
- (void)contestLoginNeedPassword:(NSNotification*)contest {
    NSLog(@"Contest #%@ need password", [contest.userInfo objectForKey:@"contestId"]);
    [Message showInputBoxWithPassword:YES message:@"请输入正确的比赛密码" title:@"比赛密码" callback:^(NSString *text) {
        NSString* password = sha1(text);
        NSLog(@"password: %@ -> %@", text, password);
        [ContestContentModel loginContestWithContestId:[contest.userInfo objectForKey:@"contestId"] andPassword:password inType:[[contest.userInfo objectForKey:@"type"] integerValue]];
    }];
}
- (void)contestLoginNeedRegister:(NSNotification*)contest {
    NSLog(@"Contest #%@ need register", [contest.userInfo objectForKey:@"contestId"]);
    [Message show:@"请先检查是否登录并已成功注册了本比赛！\n请前往网页版注册" withTitle:@"您需要先注册本比赛"];
//    [Message confirm:@"请先检查是否登录并已成功注册了本比赛！\n点击确定前往网页版注册" withTitle:@"您需要先注册本比赛" callback:^{
//        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_SKIP_CONTEST object:nil userInfo:@{@"contestId":STR([contest.userInfo objectForKey:@"contestId"]),@"action":@"register"}];
//    }];
}
- (void)contestLoginNeedPermission:(NSNotification*)contest {
    NSLog(@"Contest #%@ need permission", [contest.userInfo objectForKey:@"contestId"]);
    [Message show:STRF(@"您似乎没有权限哦\n%@", [contest.userInfo objectForKey:@"errorMessage"]) withTitle:@"Opps"];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [ContestListTableViewCell height];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* contestId = STR([self.data.list[indexPath.row] objectForKey:@"contestId"]);
    NSInteger type = [[self.data.list[indexPath.row] objectForKey:@"type"] integerValue];
    [self enterContest:contestId withType:type];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContestListTableViewCell* cell = [[ContestListTableViewCell alloc] init];
    [cell.contestId setText:STRF(@"#%@", [self.data.list[indexPath.row] objectForKey:@"contestId"])];
    [cell.title setText:STR([self.data.list[indexPath.row] objectForKey:@"title"])];
    [cell.startTime setText:getTimeString(STR([self.data.list[indexPath.row] objectForKey:@"time"]))];
    [cell.length setText:getTimeLengthString2(STR([self.data.list[indexPath.row] objectForKey:@"length"]))];
    [cell.status setText:STR([self.data.list[indexPath.row] objectForKey:@"status"])];
    [cell.typeName setText:STR([self.data.list[indexPath.row] objectForKey:@"typeName"])];
    [cell refreshTagColor];
    return cell;
}

@end
