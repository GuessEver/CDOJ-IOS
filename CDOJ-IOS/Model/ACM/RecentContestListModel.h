//
//  RecentContestListModel.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultModel.h"

@interface RecentContestListModel : DefaultModel

@property (nonatomic, strong) NSArray<NSDictionary*>* list;

- (void)fetchList;

@end
