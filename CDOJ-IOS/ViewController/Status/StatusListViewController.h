//
//  StatusListViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/21.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultDataListViewController.h"
#import "StatusListModel.h"

@interface StatusListViewController : DefaultDataListViewController


- (instancetype)initWithProblemId:(NSString*)problemId;
- (instancetype)initWithContestId:(NSString*)contestId;

@end
