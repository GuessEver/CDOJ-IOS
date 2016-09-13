//
//  ThemeSwitchViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/9/13.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ThemeSwitchViewController.h"
#import "ThemeSwitchTableViewCell.h"
#import "LocalDataModel.h"

@interface ThemeSwitchViewController ()

@end

@implementation ThemeSwitchViewController

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewStyleGrouped]) {
        self.colorSchemes = [ColorSchemeModel colorSchemes];
    }
    return self;
}

# pragma mark UITableViewDataSource
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"部分主题将在App下次启动时生效";
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.colorSchemes.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ThemeSwitchTableViewCell* cell = [[ThemeSwitchTableViewCell alloc] init];
    [cell setWithColorScheme:self.colorSchemes[indexPath.row]];
    if(indexPath.row == [LocalDataModel getDefaultThemeIndex]) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
    else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    [cell setTintColor:[ColorSchemeModel defaultColorScheme].tintColor];
    return cell;
}

# pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [ThemeSwitchTableViewCell height];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [LocalDataModel setDefaultThemeIndex:indexPath.row];
    [self.tableView reloadData];
}

@end
