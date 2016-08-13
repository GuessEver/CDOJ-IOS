//
//  DefaultNavigationController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultNavigationController.h"
#import "ColorSchemeModel.h"

@implementation DefaultNavigationController

- (instancetype)init {
    if(self = [super init]) {
        [self setBackground];
    }
    return self;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if(self = [super initWithRootViewController:rootViewController]) {
        [self setBackground];
    }
    return self;
}

- (void)setBackground {
    [self setExtendedLayoutIncludesOpaqueBars:YES];
    [self.navigationBar setTranslucent:NO];
    [self.navigationBar setBarTintColor:[ColorSchemeModel defaultColorScheme].topBarColor];
    [self.navigationBar setTintColor:[ColorSchemeModel defaultColorScheme].tintColor];
}

@end
