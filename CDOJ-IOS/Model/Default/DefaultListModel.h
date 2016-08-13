//
//  DefaultListModel.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/12.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultModel.h"

@interface DefaultListModel : DefaultModel

@property (nonatomic, strong) NSString* keyword;
@property (nonatomic, strong) NSMutableArray<NSDictionary*>* list;
@property (nonatomic, strong) NSDictionary* pageInfo;
@property BOOL hasData;


- (void)fetchDataOnPage:(NSInteger)page;
- (void)clearList;

@end
