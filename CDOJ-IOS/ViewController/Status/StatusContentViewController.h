//
//  StatusContentViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/21.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultCodeViewController.h"
#import "StatusContentModel.h"

@interface StatusContentViewController : DefaultCodeViewController

@property (nonatomic, strong) StatusContentModel* data;


- (instancetype)initWithStatusId:(NSString*)statusId andLanguageSuffix:(NSString*)suffix;

@end
