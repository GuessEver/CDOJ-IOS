//
//  ContestListViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContestListModel.h"

@interface ContestListViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) ContestListModel* data;

@end
