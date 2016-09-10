//
//  AccountManageViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import "DefaultTableViewController.h"

@interface AccountManageViewController : DefaultTableViewController;

@property (nonatomic, strong) NSMutableArray<NSDictionary*>* users;
@property (nonatomic, strong) NSString* defaultUsername;

@end
