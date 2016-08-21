//
//  ProblemPageController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultPageController.h"

@interface ProblemPageController : DefaultPageController

@property (nonatomic, strong) NSString* contestId;
@property (nonatomic, strong) NSMutableArray<NSDictionary*>* problems;
@property (nonatomic, strong) NSMutableArray<__kindof UIViewController*>* problemPages;


- (instancetype)initWithContestId:(NSString*)contestId;
- (void)loadProblemsWithData:(NSArray<NSDictionary*>*)data;

@end
