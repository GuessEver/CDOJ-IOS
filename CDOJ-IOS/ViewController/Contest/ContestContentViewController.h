//
//  ContestContentViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefaultPageController.h"
#import "ContestContentModel.h"

@interface ContestContentViewController : DefaultPageController

@property (nonatomic, strong) ContestContentModel* data;
@property (nonatomic, strong) NSArray* titleOfTabs;

- (instancetype)initWithContestId:(NSString*)cid;

@end
