//
//  ContestRankListModel.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultListModel.h"

@interface ContestRankListModel : DefaultListModel

@property (nonatomic, strong) NSString* requestUrl;

- (instancetype)initWithContestId:(NSString*)contestId;

@end
