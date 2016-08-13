//
//  UserSettingViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserSettingViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property NSInteger noUserLogin;
@property (nonatomic, strong) NSArray<NSString*>* titleOfSections;
@property (nonatomic, strong) NSArray<NSArray<NSString*>*>* data;
@property (nonatomic, strong) NSArray<NSArray<__kindof UIViewController*>*>* classType;

@end
