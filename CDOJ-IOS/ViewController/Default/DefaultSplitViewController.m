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
        
        [self.view setBackgroundColor:COLOR_GRAY];
    }
    return self;
}

@end
