//
//  ContestRankListViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultDataListViewController.h"
#import "ContestRankListModel.h"

@interface ContestRankListViewController : DefaultDataListViewController

- (instancetype)initWithContestId:(NSString*)contestId;

@end
