//
//  StatusContentModel.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/21.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultModel.h"

@interface StatusContentModel : DefaultModel

@property (nonatomic, strong) NSString* content;


- (void)fetchDataWithStatusId:(NSString*)statusId;

@end
