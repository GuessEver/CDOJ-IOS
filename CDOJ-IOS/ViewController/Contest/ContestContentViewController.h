//
//  ContestContentViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefaultPageController.h"
#import "ContestContentModel.h"
#import "ContestOverViewController.h"
#import "ProblemPageController.h"
#import "ContestClarificationViewController.h"
#import "StatusListViewController.h"
#import "ContestRankListViewController.h"

@interface ContestContentViewController : DefaultPageController

@property (nonatomic, strong) ContestContentModel* data;
@property (nonatomic, strong) NSArray<NSString*>* titleOfTabs;
@property (nonatomic, strong) NSArray<__kindof UIViewController*>* controllersOfTabs;

@property (nonatomic, strong) ContestOverViewController* tab_overview;
@property (nonatomic, strong) ProblemPageController* tab_problems;
@property (nonatomic, strong) ContestClarificationViewController* tab_clarification;
@property (nonatomic, strong) StatusListViewController* tab_status;
@property (nonatomic, strong) ContestRankListViewController* tab_rank;

- (instancetype)initWithContestId:(NSString*)contestId;

@end
