//
//  DefaultNavigationController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultNavigationController.h"
#import "Color.h"

@implementation DefaultNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if(self = [super initWithRootViewController:rootViewController]) {
        [self.navigationBar setTranslucent:NO];
        [self.navigationBar setBarTintColor:COLOR_BAR];
    }
    return self;
}

@end
