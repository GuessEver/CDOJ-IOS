//
//  ContestRegisterViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultViewController.h"
#import "DefaultWebView.h"

@interface ContestRegisterViewController : DefaultViewController

@property (nonatomic, strong) NSString* contestId;
@property (nonatomic, strong) DefaultWebView* webView;


- (instancetype)initWithContestId:(NSString*)contestId;

@end
