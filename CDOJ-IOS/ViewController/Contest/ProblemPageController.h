//
//  ProblemPageController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultPageController.h"

@interface ProblemPageController : DefaultPageController

@property (nonatomic, strong) NSMutableArray* problems;
@property (nonatomic, strong) NSMutableArray* problemPages;


- (void)loadProblemsWithData:(NSArray*)data;

@end
