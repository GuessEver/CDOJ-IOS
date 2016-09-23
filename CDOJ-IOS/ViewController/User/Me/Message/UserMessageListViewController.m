//
//  UserMessageListViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 2016/9/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "UserMessageListViewController.h"
#import "UserMessageContentViewController.h"
#import "UserMessageListTableViewCell.h"

@interface UserMessageListViewController ()

@end

@implementation UserMessageListViewController

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        self.data = [[MessageListModel alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshList) name:NOTIFICATION_MESSAGE_LIST_REFRESHED object:nil];
        // refresh data when entering
        [self.tableView.mj_header beginRefreshing];
    }
    return self;
}

- (void)showMessageWithMessageId:(NSString*)messageId {
    UserMessageContentViewController* article = [[UserMessageContentViewController alloc] initWithMessageId:messageId];
    [self.navigationController pushViewController:article animated:YES];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UserMessageListTableViewCell height];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.data setOpenStatus:YES atIndex:indexPath.row];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self showMessageWithMessageId:STR([self.data.list[indexPath.row] objectForKey:@"messageId"])];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserMessageListTableViewCell* cell = [[UserMessageListTableViewCell alloc] init];
    NSDictionary* info = self.data.list[indexPath.row];
    [cell setSenderEmail:STR([info objectForKey:@"senderEmail"])];
    [cell setReceiverEmail:STR([info objectForKey:@"receiverEmail"])];
    [cell.senderUsername setText:STR([info objectForKey:@"senderUserName"])];
    [cell.receiverUsername setText:STR([info objectForKey:@"receiverUserName"])];
    [cell.content setText:STR([info objectForKey:@"title"])];
    [cell.time setText:getTimeString([info objectForKey:@"time"])];
    [cell loadAvatar];
    [cell loadOpenStatusTag:[STR([info objectForKey:@"isOpened"]) boolValue]];
    return cell;
}

@end
