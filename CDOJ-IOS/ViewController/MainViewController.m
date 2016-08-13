//
//  MainViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "MainViewController.h"
#import "NoticeMainViewController.h"
#import "ProblemMainViewController.h"
#import "ContestMainViewController.h"
#import "UserMainViewController.h"
#import "ColorSchemeModel.h"
#import "Masonry.h"
#import "Notification.h"
#import "UserModel.h"
#import "LocalDataModel.h"

@implementation MainViewController

- (instancetype)init {
    if(self = [super init]) {
        NoticeMainViewController* noticePage = [[NoticeMainViewController alloc] init];
        noticePage.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"公告"
                                                              image:[UIImage imageNamed:@"notice"]
                                                      selectedImage:[UIImage imageNamed:@"notice_selected"]];
        
        ProblemMainViewController* problemPage = [[ProblemMainViewController alloc] init];
        problemPage.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"题库"
                                                               image:[UIImage imageNamed:@"problem"]
                                                       selectedImage:[UIImage imageNamed:@"problem_selected"]];
        
        ContestMainViewController* contestPage = [[ContestMainViewController alloc] init];
        contestPage.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"比赛"
                                                               image:[UIImage imageNamed:@"contest"]
                                                       selectedImage:[UIImage imageNamed:@"contest_selected"]];
        
        UserMainViewController* userPage = [[UserMainViewController alloc] init];
        userPage.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我"
                                                            image:[UIImage imageNamed:@"user"]
                                                    selectedImage:[UIImage imageNamed:@"user_selected"]];
        
        [self setViewControllers:@[noticePage, problemPage, contestPage, userPage]];
        [self setSelectedIndex:0];
        
        [self.tabBar setTranslucent:NO];
        [self.tabBar setBarTintColor:[ColorSchemeModel defaultColorScheme].bottomBarColor];
        [self.tabBar setTintColor:[ColorSchemeModel defaultColorScheme].tintColor];
        
        // check networking status
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkConnecting) name:NOTIFICATION_HTTP_CONNECTING object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkConnected) name:NOTIFICATION_HTTP_CONNECTED object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkError) name:NOTIFICATION_HTTP_ERROR object:nil];
        [self initNetworkConnectionErrorTipBar];
    }
    return self;
}

#pragma mark network tips
- (void)setNetworkIndicator {
    if(self.numberOfNetworkConnections > 0) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    }
    else {
        self.numberOfNetworkConnections = 0;
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }
}
- (void)networkConnecting {
    self.numberOfNetworkConnections += 1;
    [self setNetworkIndicator];
}
- (void)networkConnected {
    self.numberOfNetworkConnections -= 1;
    [self removeNetworkConnectionErrorTipBar];
    [self setNetworkIndicator];
}
- (void)networkError {
    self.numberOfNetworkConnections -= 1;
    [self showNetworkConnectionErrorTipBar];
    [self setNetworkIndicator];
}
- (void)showNetworkConnectionErrorTipBar {
    [self.view bringSubviewToFront:self.networkConnectionErrorTipBar];
    [UIView animateWithDuration:0.5 animations:^{
        [self.networkConnectionErrorTipBar setAlpha:1];
    }];
}
- (void)removeNetworkConnectionErrorTipBar {
    [UIView animateWithDuration:0.5 animations:^{
        [self.networkConnectionErrorTipBar setAlpha:0];
    }];
//    [self.view sendSubviewToBack:self.networkConnectionErrorTipBar];
}
- (void)initNetworkConnectionErrorTipBar {
    UILabel* tip = [[UILabel alloc] init];
    [tip setBackgroundColor:nil];
    [tip setText:@"网络连接错误，请检查网络设置"];
    [tip setFont:[UIFont systemFontOfSize:12]];
    [tip setTextColor:COLOR_WHITE];
    [tip setTextAlignment:NSTextAlignmentCenter];
    self.networkConnectionErrorTipBar = [[UIView alloc] init];
    [self.networkConnectionErrorTipBar setBackgroundColor:COLOR_RED];
    [self.networkConnectionErrorTipBar addSubview:tip];
    [self.view addSubview:self.networkConnectionErrorTipBar];
    [tip mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.networkConnectionErrorTipBar.mas_left);
        make.width.equalTo(self.networkConnectionErrorTipBar.mas_width);
        make.bottom.equalTo(self.networkConnectionErrorTipBar.mas_bottom).offset(-5);
        make.height.equalTo(@10);
    }];
    [self.networkConnectionErrorTipBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.width.equalTo(self.view.mas_width);
        make.top.equalTo(self.view.mas_top);
        make.height.equalTo(@35);
    }];
    [self.networkConnectionErrorTipBar setAlpha:0];
}
@end
