//
//  ContestContentViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestContentViewController.h"
#import "Color.h"
#import "Masonry.h"
#import "ProblemPageController.h"

@implementation ContestContentViewController

- (instancetype)initWithContestId:(NSString*)cid {
    if(self = [super init]) {
        self.titleOfTabs = @[@"概览", @"题目", @"讨论", @"记录", @"排名"];
        self.controllersOfTabs = @[
                                   self.tab_overview = [[ContestOverViewController alloc] init],
                                   self.tab_problems = [[ProblemPageController alloc] init],
                                   [[UIViewController alloc] init],
                                   [[UIViewController alloc] init],
                                   [[UIViewController alloc] init]
                                   ];
        
        self.data = [[ContestContentModel alloc] init];
        [self.data fetchDataWithContestId:cid];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NOTIFICATION_CONTEST_DATA_REFRESHED object:nil];
        
        [self.view setBackgroundColor:COLOR_BACKGROUND];
        
        // Options
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
    }
    return self;
}

- (void)refreshData {
    [self.tab_overview loadDetailWithData:self.data.detail];
    [self.tab_problems loadProblemsWithData:self.data.problems];
}

#pragma mark WMPageControllerDataSource
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return [self.titleOfTabs count];
}
- (__kindof UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    return self.controllersOfTabs[index];
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleOfTabs[index];
}

@end
