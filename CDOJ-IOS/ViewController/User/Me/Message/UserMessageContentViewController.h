//
//  UserMessageContentViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 2016/9/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultViewController.h"
#import "MessageContentModel.h"
#import "DefaultWebView.h"

@interface UserMessageContentViewController : DefaultViewController

@property (nonatomic, strong) NSString* htmlStr;
@property (nonatomic, strong) DefaultWebView* webView;
@property (nonatomic, strong) MessageContentModel* data;


- (instancetype)initWithMessageId:(NSString*)messageId;

@end
