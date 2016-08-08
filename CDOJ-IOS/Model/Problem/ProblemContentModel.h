//
//  ProblemContentModel.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/16.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DefaultModel.h"

@interface ProblemContentModel : DefaultModel

@property (nonatomic, strong) NSDictionary* content;


- (void)fetchDataWithProblemId:(NSString*)pid;

@end
