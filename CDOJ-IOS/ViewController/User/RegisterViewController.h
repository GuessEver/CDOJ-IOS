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

@property (nonatomic, strong) NSArray<NSString*>* sectionHeaderTitle;
@property (nonatomic, strong) NSArray<NSString*>* sectionFooterTitle;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSString*>*>* userInfoTitle;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSString*>*>* userInfoKey;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<RegisterTableViewCell*>*>* userInfoInput;
- (void)loadData:(NSDictionary*)data;
- (NSDictionary*)getUserDict;

@property (nonatomic, strong) NSIndexPath* selectPageParentIndexPath;
@property (nonatomic, strong) DefaultTableViewController* selectPage;


@end
