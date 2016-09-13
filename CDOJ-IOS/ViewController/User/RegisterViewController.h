//
//  RegisterViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/9/10.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefaultTableViewController.h"
#import "RegisterTableViewCell.h"

@interface RegisterViewController : DefaultTableViewController;

@property BOOL isRegister;

@property (nonatomic, strong) NSArray<NSString*>* sectionHeaderTitle;
@property (nonatomic, strong) NSArray<NSString*>* sectionFooterTitle;
@property (nonatomic, strong) NSArray<NSArray<NSString*>*>* userInfoTitle;
@property (nonatomic, strong) NSArray<NSArray<NSString*>*>* userInfoKey;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<RegisterTableViewCell*>*>* userInfoInput;

@property (nonatomic, strong) NSIndexPath* selectPageParentIndexPath;
@property (nonatomic, strong) DefaultTableViewController* selectPage;

- (instancetype)initWithRegister;
- (instancetype)initWithEdit;

@end
