//
//  DefaultListModel.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/12.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultListModel.h"

@implementation DefaultListModel

- (instancetype)init {
    if(self = [super init]) {
        self.hasData = NO;
        self.keyword = @"";
        self.list = [[NSMutableArray alloc] init];
        self.pageInfo = [[NSDictionary alloc] init];
    }
    return self;
}

- (void)clearList {
    self.hasData = NO;
    self.list = [[NSMutableArray alloc] init];
}

#pragma mark override required functions
- (void)fetchDataOnPage:(NSInteger)page {
}

@end
