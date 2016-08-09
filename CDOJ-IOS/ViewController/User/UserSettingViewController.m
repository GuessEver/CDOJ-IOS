//
//  UserSettingViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "UserSettingViewController.h"
#import "Color.h"
#import "DefaultNavigationController.h"
#import "AccountManageViewController.h"
#import "AboutCDOJViewController.h"

@implementation UserSettingViewController

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewStyleGrouped]) {
        [self setTitle:@"用户中心"];
        [self.tableView setBackgroundColor:COLOR_BACKGROUND];
        self.noUserLogin = 1; // set the offset to hide "我**" options when not login
        self.titleOfSections = @[@"我", @"设置", @"关于"];
        self.data = @[
                      @[@"我的资料", @"我的成就", @"我的博客", @"我的队伍", @"我的消息"],
                      @[@"账号管理"],
                      @[@"关于CDOJ"]
                      ];
    }
    return self;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section + self.noUserLogin;
    NSInteger row = indexPath.row;
    __kindof UIViewController* root;
    if(section == 0) { // 我
        if(row == 0) { // 我的资料
        }
        else if(row == 1) { // 我的成就
        }
        else if(row == 2) { // 我的博客
        }
        else if(row == 3) { // 我的队伍
        }
        else if(row == 4) { // 我的消息
        }
    }
    else if(section == 1) { // 设置
        if(row == 0) { //  账号管理
            root = [[AccountManageViewController alloc] init];
        }
    }
    else if(section == 2) { // 关于
        if(row == 0) { // 关于CDOJ
            root = [[AboutCDOJViewController alloc] init];
        }
    }
    DefaultNavigationController* nav = [[DefaultNavigationController alloc] initWithRootViewController:root];
    [self.splitViewController showDetailViewController:nav sender:nil];
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.titleOfSections count] - self.noUserLogin;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.titleOfSections[section + self.noUserLogin];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data[section + self.noUserLogin] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    [cell.textLabel setText:self.data[indexPath.section + self.noUserLogin][indexPath.row]];
    return cell;
}
@end
