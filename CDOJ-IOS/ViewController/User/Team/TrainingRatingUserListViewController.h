//
//  TrainingRatingUserListViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrainingRatingContentModel.h"

@interface TrainingRatingUserListViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) TrainingRatingContentModel* data;

- (instancetype)initWithTrainingId:(NSString*)trainingId;

@end
