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
    NSLog(@"problem count: %ld", (unsigned long)[self.problems count]);
    return [self.problems count];
}
- (UIViewController *)pagerController:(TYPagerController *)pagerController controllerForIndex:(NSInteger)index {
    return self.problemPages[index];
}
- (NSString *)pagerController:(TYPagerController *)pagerController titleForIndex:(NSInteger)index {
    return STRF(@"%@", [self.problems[index] objectForKey:@"orderCharacter"]);
}

@end
