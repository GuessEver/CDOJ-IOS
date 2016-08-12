//
//  DefaultDataListViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/11.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJRefresh.h"
#import "ProblemListModel.h"
#import "DefaultListModel.h"

@interface DefaultDataListViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) __kindof DefaultListModel* data;
@property (nonatomic, strong) MJRefreshNormalHeader* refreshHeader;
@property (nonatomic, strong) MJRefreshAutoNormalFooter* refreshFooter;


- (void)refreshList;

@end
