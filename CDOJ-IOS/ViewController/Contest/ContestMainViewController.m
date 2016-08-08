//
//  ContestMainViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ContestMainViewController.h"
#import "Color.h"

@implementation ContestMainViewController

- (instancetype)init {
    if(self = [super init]) {
        [self setViewControllers:@[[[UIViewController alloc] init]]];
    }
    return self;
}

@end
