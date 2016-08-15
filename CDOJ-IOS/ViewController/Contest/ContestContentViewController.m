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

- (instancetype)initWithContestId:(NSString*)contestId {
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
        [self.data fetchDataWithContestId:contestId];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:NOTIFICATION_CONTEST_DATA_REFRESHED object:nil];
        
        // Options
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(openInBrowser)];
    }
    return self;
}

- (void)openInBrowser {
    NSURL* url = [NSURL URLWithString:STRF(@"%@/#/contest/show/%@", APIURL, [self.data.detail objectForKey:@"contestId"])];
    [[UIApplication sharedApplication] openURL:url];
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

@end
