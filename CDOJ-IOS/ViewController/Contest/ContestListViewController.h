//
//  ContestListViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultDataListViewController.h"
#import "ContestListModel.h"

@interface ContestListViewController : DefaultDataListViewController

@property (nonatomic, strong) ContestListModel* data;

@end
