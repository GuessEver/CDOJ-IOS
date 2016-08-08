//
//  ProblemListViewController.h
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProblemListModel.h"

@interface ProblemListViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) ProblemListModel* data;


@end
