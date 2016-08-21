//
//  ProblemPageController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ProblemPageController.h"
#import "ProblemContentViewController.h"
#import "LocalDataModel.h"

@implementation ProblemPageController

- (instancetype)initWithContestId:(NSString*)contestId {
    if(self = [super init]) {
        self.contestId = contestId;
        self.problems = [[NSMutableArray alloc] init];
        self.problemPages = [[NSMutableArray alloc] init];
        [self setCellWidth:70];
    }
    return self;
}

- (void)loadProblemsWithData:(NSArray<NSDictionary*>*)data {
//    [self setProblems:data];
    for(int i = 0; i < data.count; i++) {
        [self.problems addObject:data[i]];
        [self.problemPages addObject:[[ProblemContentViewController alloc] initWithProblemContent:self.problems[i]]];
    }
    [self reloadData];
}

#pragma mark TYPagerControllerDataSource
- (NSInteger)numberOfControllersInPagerController {
//    NSLog(@"problem count: %ld", (unsigned long)[self.problems count]);
    return [self.problems count];
}
- (UIViewController *)pagerController:(TYPagerController *)pagerController controllerForIndex:(NSInteger)index {
    return self.problemPages[index];
}
- (NSString *)pagerController:(TYPagerController *)pagerController titleForIndex:(NSInteger)index {
    return STR([self.problems[index] objectForKey:@"orderCharacter"]);
}

#pragma mark TYPagerControllerDelegate
- (void)pagerController:(TYTabPagerController *)pagerController didScrollToTabPageIndex:(NSInteger)index {
    [LocalDataModel setCurrentProblem:STR([self.problems[index] objectForKey:@"problemId"]) inContest:self.contestId withOrderCharacter:STR([self.problems[index] objectForKey:@"orderCharacter"])];
}

@end
