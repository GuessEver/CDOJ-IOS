//
//  DefaultTableViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/9/10.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultTableViewController.h"

@interface DefaultTableViewController ()

@end

@implementation DefaultTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style {
    if(self = [super initWithStyle:style]) {
        [self.tableView setBackgroundColor:[ColorSchemeModel defaultColorScheme].backgroundColor1];
    }
    return self;
}

- (instancetype)init {
    if(self = [super init]) {
        [self.tableView setBackgroundColor:[ColorSchemeModel defaultColorScheme].backgroundColor1];
    }
    return self;
}

@end
