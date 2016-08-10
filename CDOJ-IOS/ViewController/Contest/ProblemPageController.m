//
//  ProblemPageController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ProblemPageController.h"
#import "ProblemContentViewController.h"

@implementation ProblemPageController

- (instancetype)init {
    if(self = [super init]) {
        self.problems = [[NSMutableArray alloc] init];
        self.problemPages = [[NSMutableArray alloc] init];
        [self setMenuHeight:80];
        [self setTitleSizeNormal:self.titleSizeNormal-1];
    }
    return self;
}

- (void)loadProblemsWithData:(NSArray*)data {
//    [self setProblems:data];
    for(int i = 0; i < data.count; i++) {
        [self.problems addObject:data[i]];
        [self.problemPages addObject:[[ProblemContentViewController alloc] initWithProblemContent:self.problems[i]]];
    }
    if(data.count) { // WMPageController cannot has 0 tabs
        [self reloadData];
    }
}

#pragma mark WMPageControllerDataSource
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    NSLog(@"problem count: %ld", [self.problems count]);
    return [self.problems count];
}
- (__kindof UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    return self.problemPages[index];
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
//    NSLog(@"%@", self.problems[index]);
    return [NSString stringWithFormat:@"\n\n%@", [self.problems[index] objectForKey:@"orderCharacter"]];
}

@end
