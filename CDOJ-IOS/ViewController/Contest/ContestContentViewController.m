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
#import "CodeSubmitViewController.h"
#import "DefaultNavigationController.h"

@implementation ContestContentViewController

- (instancetype)initWithContestId:(NSString*)contestId {
    if(self = [super init]) {
        self.titleOfTabs = @[@"概览", @"题目", @"讨论", @"记录", @"排名"];
        self.controllersOfTabs = @[
                                   self.tab_overview = [[ContestOverViewController alloc] init],
                                   self.tab_problems = [[ProblemPageController alloc] initWithContestId:contestId],
                                   self.tab_clarification = [[ContestClarificationViewController alloc] initWithContestId:contestId],
                                   self.tab_status = [[StatusListViewController alloc] initWithContestId:contestId],
                                   self.tab_rank = [[ContestRankListViewController alloc] initWithContestId:contestId]
                                   ];
        
        self.data = [[ContestContentModel alloc] init];
        [self loadWebActionBarButtonsWithUrl:STRF(@"%@/#/contest/show/%@", APIURL, contestId)];
        [self.data fetchDataWithContestId:contestId];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NOTIFICATION_CONTEST_DATA_REFRESHED object:nil];
    }
    return self;
}

- (void)refreshData {
//    NSLog(@"%@\n%@", self.data.detail, self.data.problems);
    [self.tab_overview loadDetailWithData:self.data.detail];
    [self.tab_problems loadProblemsWithData:self.data.problems];
    [self reloadData];
}

#pragma mark TYPagerControllerDataSource
- (NSInteger)numberOfControllersInPagerController {
    return [self.titleOfTabs count];
}
- (UIViewController *)pagerController:(TYPagerController *)pagerController controllerForIndex:(NSInteger)index {
    return self.controllersOfTabs[index];
}
- (NSString *)pagerController:(TYPagerController *)pagerController titleForIndex:(NSInteger)index {
    return self.titleOfTabs[index];
}

#pragma mark TYPagerControllerDelegate
- (void)pagerController:(TYTabPagerController *)pagerController didScrollToTabPageIndex:(NSInteger)index {
    if(index == 1) {
        self.navigationItem.rightBarButtonItems = @[
                                                    self.navigationItem.rightBarButtonItem,
                                                    [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(openSubmitPage)]
                                                    ];
    }
    else {
        self.navigationItem.rightBarButtonItems = @[
                                                    self.navigationItem.rightBarButtonItem
                                                    ];
    }
}

- (void)openSubmitPage {
    CodeSubmitViewController* submitPage = [[CodeSubmitViewController alloc] init];
    [self presentViewController:[[DefaultNavigationController alloc] initWithCancelButtonOnLeftAndRootViewController:submitPage] animated:YES completion:nil];
}

@end
