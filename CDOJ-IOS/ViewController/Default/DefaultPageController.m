//
//  DefaultPageController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultPageController.h"
#import "Color.h"

@implementation DefaultPageController

- (instancetype)init {
    if(self = [super init]) {
        [self setMenuViewStyle:WMMenuViewStyleLine];
        [self setMenuBGColor:COLOR_BACKGROUND];
        [self setProgressColor:COLOR_TITLE];
        [self setTitleColorSelected:COLOR_TITLE];
        [self setDataSource:self];
        [self setExtendedLayoutIncludesOpaqueBars:YES];
    }
    return self;
}

@end
