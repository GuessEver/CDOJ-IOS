//
//  RecentContestListViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecentContestListModel.h"
#import "DefaultTableViewController.h"

@interface RecentContestListViewController : DefaultTableViewController;

@property (nonatomic, strong) RecentContestListModel* data;

@end
