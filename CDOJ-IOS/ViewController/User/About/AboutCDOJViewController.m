//
//  AboutCDOJViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "AboutCDOJViewController.h"
#import "Global.h"
#import "String.h"

@implementation AboutCDOJViewController

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewStylePlain]) {
        [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        self.content = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        
        UIImageView* logoView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        [logoView setTintColor:[ColorSchemeModel defaultColorScheme].tintColor];
        [self.content addSubview:logoView];
        
        UILabel* appName = [[UILabel alloc] init];
        [appName setTextAlignment:NSTextAlignmentCenter];
        [appName setText:APP_NAME];
        [appName setTextColor:[ColorSchemeModel defaultColorScheme].textColor];
        [self.content addSubview:appName];
        
        UILabel* appVersion = [[UILabel alloc] init];
        [appVersion setTextAlignment:NSTextAlignmentCenter];
        [appVersion setText:STRF(@"Version %@ Build %@", APP_VERSION, APP_BUILD)];
        [appVersion setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
        [appVersion setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.content addSubview:appVersion];
        
        UILabel* description = [[UILabel alloc] init];
        [description setTextAlignment:NSTextAlignmentCenter];
        [description setNumberOfLines:0];
        [description setText:APP_DESCRIPTION];
        [description setTextColor:[ColorSchemeModel defaultColorScheme].textColor];
        [self.content addSubview:description];
        
        UILabel* feedback = [[UILabel alloc] init];
        [feedback setTextAlignment:NSTextAlignmentCenter];
        [feedback setNumberOfLines:0];
        [feedback setText:APP_FEEDBACK];
        [feedback setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
        [feedback setTextColor:[ColorSchemeModel defaultColorScheme].commentColor];
        [self.content addSubview:feedback];
        
        [logoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.lessThanOrEqualTo(@150);
            make.width.lessThanOrEqualTo(self.content.mas_width).multipliedBy(0.3);
            make.width.lessThanOrEqualTo(self.content.mas_height).multipliedBy(0.3);
            make.height.equalTo(logoView.mas_width);
            make.centerX.equalTo(self.content.mas_centerX);
            make.top.equalTo(self.content.mas_top).offset(50);
        }];
        [appName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.content.mas_centerX);
            make.left.equalTo(self.content.mas_left).offset(20);
            make.right.equalTo(self.content.mas_right).offset(-20);
            make.top.equalTo(logoView.mas_bottom).offset(50);
        }];
        [appVersion mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.content.mas_centerX);
            make.left.equalTo(self.content.mas_left).offset(20);
            make.right.equalTo(self.content.mas_right).offset(-20);
            make.top.equalTo(appName.mas_bottom).offset(10);
        }];
        [description mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.content.mas_centerX);
            make.left.equalTo(self.content.mas_left).offset(20);
            make.right.equalTo(self.content.mas_right).offset(-20);
            make.top.equalTo(appVersion.mas_bottom).offset(30);
        }];
        [feedback mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.content.mas_centerX);
            make.left.equalTo(self.content.mas_left).offset(20);
            make.right.equalTo(self.content.mas_right).offset(-20);
            make.top.equalTo(description.mas_bottom).offset(10);
        }];
    }
    return self;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 350;
}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.content;
}

@end
