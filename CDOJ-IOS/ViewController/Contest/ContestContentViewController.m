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

@implementation ContestContentViewController

- (instancetype)initWithContestId:(NSString*)cid {
    if(self = [super init]) {
        self.titleOfTabs = @[@"概览", @"题库", @"讨论", @"记录", @"排名"];
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
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.data.detail
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    NSLog(@"%@", jsonString);
}

#pragma mark WMPageControllerDataSource
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return [self.titleOfTabs count];
}
- (__kindof UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    UIViewController* A = [[UIViewController alloc] init];
    [A.view setBackgroundColor:[UIColor yellowColor]];
    UILabel* B = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [B setText:[NSString stringWithFormat:@"%ld", index]];
    [A.view addSubview:B];
    return A;
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleOfTabs[index];
}

@end
