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
#import "Color.h"

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
        [self.tabBar setBarTintColor:COLOR_BAR];
//        [self.tabBar setTintColor:COLOR_NAV];
    }
    return self;
}

@end
