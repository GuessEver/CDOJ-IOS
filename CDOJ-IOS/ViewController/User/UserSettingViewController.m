//
//  UserSettingViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "UserSettingViewController.h"
#import "Color.h"

@implementation UserSettingViewController

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewStyleGrouped]) {
        [self setTitle:@"用户中心"];
        [self.tableView setBackgroundColor:COLOR_BACKGROUND];
        self.titleOfSections = @[@"我", @"设置", @"关于"];
        self.data = @[
                      @[@"个人信息", @"成就"],
                      @[@"A", @"B"],
                      @[@"关于CDOJ"]
                      ];
    }
    return self;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"select: %ld", indexPath.row);
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.titleOfSections count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.titleOfSections[section];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    [cell.textLabel setText:self.data[indexPath.section][indexPath.row]];
    return cell;
}
@end
