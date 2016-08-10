//
//  AboutCDOJViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "AboutCDOJViewController.h"
#import "Global.h"

@implementation AboutCDOJViewController

- (instancetype)init {
    if(self = [super init]) {
        UIImageView* logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
        [self.view addSubview:logoView];
        
        UILabel* appName = [[UILabel alloc] init];
        [appName setTextAlignment:NSTextAlignmentCenter];
        [appName setText:APP_NAME];
//        [appName setTextColor:COLOR_COMMENT];
        [self.view addSubview:appName];
        
        UILabel* appVersion = [[UILabel alloc] init];
        [appVersion setTextAlignment:NSTextAlignmentCenter];
        [appVersion setText:[NSString stringWithFormat:@"Version %@ Build %@", APP_VERSION, APP_BUILD]];
        [appVersion setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
        [appVersion setTextColor:COLOR_COMMENT];
        [self.view addSubview:appVersion];
        
        UILabel* description = [[UILabel alloc] init];
        [description setTextAlignment:NSTextAlignmentCenter];
        [description setNumberOfLines:0];
        [description setText:APP_DESCRIPTION];
        [self.view addSubview:description];
        
        UILabel* feedback = [[UILabel alloc] init];
        [feedback setTextAlignment:NSTextAlignmentCenter];
        [feedback setNumberOfLines:0];
        [feedback setText:APP_FEEDBACK];
        [feedback setFont:[UIFont systemFontOfSize:[UIFont systemFontSize]]];
        [feedback setTextColor:COLOR_COMMENT];
        [self.view addSubview:feedback];
        
        NSDictionary* views = @{@"logo":logoView,@"name":appName,@"version":appVersion,@"description":description,@"feedback":feedback};
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[logo]-50-[name]-10-[version]-30-[description]-10-[feedback]" options:0 metrics:nil views:views]];
        [logoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.lessThanOrEqualTo(@150);
            make.width.lessThanOrEqualTo(self.view.mas_width).multipliedBy(0.3);
            make.width.lessThanOrEqualTo(self.view.mas_height).multipliedBy(0.3);
            make.height.equalTo(logoView.mas_width);
            make.centerX.equalTo(self.view.mas_centerX);
        }];
        [appName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.mas_centerX);
            make.left.equalTo(self.view.mas_left).offset(20);
            make.right.equalTo(self.view.mas_right).offset(-20);
        }];
        [appVersion mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.mas_centerX);
            make.left.equalTo(self.view.mas_left).offset(20);
            make.right.equalTo(self.view.mas_right).offset(-20);
        }];
        [description mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.mas_centerX);
            make.left.equalTo(self.view.mas_left).offset(20);
            make.right.equalTo(self.view.mas_right).offset(-20);
        }];
        [feedback mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.mas_centerX);
            make.left.equalTo(self.view.mas_left).offset(20);
            make.right.equalTo(self.view.mas_right).offset(-20);
        }];
    }
    return self;
}

@end
