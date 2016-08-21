//
//  StatusListModel.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/21.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultListModel.h"

@interface StatusListModel : DefaultListModel

@property (nonatomic, strong) NSString* contestId;
@property (nonatomic, strong) NSString* userName;
@property (nonatomic, strong) NSString* problemId;


- (instancetype)initWithProblemId:(NSString*)problemId;
- (instancetype)initWithContestId:(NSString*)contestId;

@end
