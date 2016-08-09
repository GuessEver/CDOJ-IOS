//
//  UserSettingViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserSettingViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray* titleOfSections;
@property (nonatomic, strong) NSArray* data;

@end
