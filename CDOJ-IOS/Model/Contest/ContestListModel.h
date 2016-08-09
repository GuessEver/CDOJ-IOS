//
//  ContestListModal.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/28.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DefaultModel.h"

@interface ContestListModel : DefaultModel

@property (nonatomic, strong) NSMutableArray* list;
@property (nonatomic, strong) NSDictionary* pageInfo;


- (void)fetchDataOnPage:(NSInteger)page;

@end
