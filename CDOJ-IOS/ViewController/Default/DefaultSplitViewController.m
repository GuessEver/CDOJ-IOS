//
//  DefaultSplitViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultSplitViewController.h"

@implementation DefaultSplitViewController

- (instancetype)init {
    if(self = [super init]) {
        [self setDelegate:self];
        [self setExtendedLayoutIncludesOpaqueBars:YES];
    }
    return self;
}

#pragma mark UISplitViewDelegate
- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation {
    return NO;
}

@end
