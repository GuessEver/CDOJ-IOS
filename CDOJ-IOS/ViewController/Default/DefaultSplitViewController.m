//
//  DefaultSplitViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultSplitViewController.h"
#import "DefaultSplitDetailLogoViewController.h"
#import "Color.h"

@implementation DefaultSplitViewController

- (instancetype)init {
    if(self = [super init]) {
        [self setViewControllers:@[[[UIViewController alloc] init]]];
        [self setPreferredDisplayMode:UISplitViewControllerDisplayModeAllVisible];
        [self setExtendedLayoutIncludesOpaqueBars:YES];
        
        [self.view setBackgroundColor:COLOR_GRAY]; // split line color
        
        [self setDelegate:self];
    }
    return self;
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController showDetailViewController:(UIViewController *)vc sender:(id)sender {
    if([vc isKindOfClass:[UINavigationController class]]) {
        __kindof UINavigationController* detailView = (__kindof UINavigationController*)vc;
        detailView.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
        [detailView.topViewController.navigationItem setLeftItemsSupplementBackButton:YES];
    }
    return NO; // let system to do the others such as showing detailView
}

@end
