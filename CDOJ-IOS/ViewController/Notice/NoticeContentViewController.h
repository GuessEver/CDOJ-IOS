//
//  NoticeContentViewController.h
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultViewController.h"
#import "NoticeContentModel.h"
#import "DefaultWebView.h"

@interface NoticeContentViewController : DefaultViewController

@property (nonatomic, strong) NSString* htmlStr;
@property (nonatomic, strong) DefaultWebView* webView;
@property (nonatomic, strong) NoticeContentModel* data;


- (instancetype)initWithArticleId:(NSString*)aid;

@end
