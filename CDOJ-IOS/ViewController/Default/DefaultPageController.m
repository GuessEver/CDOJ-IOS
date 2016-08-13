//
//  DefaultPageController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultPageController.h"

@implementation DefaultPageController

- (instancetype)init {
    if(self = [super init]) {
        [self.view setBackgroundColor:[ColorSchemeModel defaultColorScheme].backgroundColor2];
        [self setMenuViewStyle:WMMenuViewStyleLine];
        [self setMenuBGColor:[ColorSchemeModel defaultColorScheme].backgroundColor1];
        [self setProgressColor:[ColorSchemeModel defaultColorScheme].tintColor];
        [self setTitleColorSelected:[ColorSchemeModel defaultColorScheme].tintColor];
        [self setMenuHeight:40];
        [self setDataSource:self];
//        [self setShowOnNavigationBar:YES];
        [self setExtendedLayoutIncludesOpaqueBars:YES];
    }
    return self;
}

@end
