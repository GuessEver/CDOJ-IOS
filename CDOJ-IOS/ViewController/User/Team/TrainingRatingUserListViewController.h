//
//  TrainingRatingUserListViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultViewController.h"
#import "TrainingRatingContentModel.h"
#import "JBChartView.h"
#import "JBLineChartView.h"

@interface TrainingRatingUserListViewController : DefaultViewController <UITableViewDelegate, UITableViewDataSource, JBLineChartViewDelegate, JBLineChartViewDataSource>

@property (nonatomic, strong) TrainingRatingContentModel* data;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) JBLineChartView* graph;
@property (nonatomic, strong) NSMutableArray<NSNumber*>* userVisibility;

- (instancetype)initWithTrainingId:(NSString*)trainingId;

@end
