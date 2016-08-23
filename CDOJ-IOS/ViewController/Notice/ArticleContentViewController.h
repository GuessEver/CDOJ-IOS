//
//  ArticleContentViewController.h
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultViewController.h"
#import "ArticleContentModel.h"
#import "DefaultWebView.h"

@interface ArticleContentViewController : DefaultViewController

@property (nonatomic, strong) NSString* htmlStr;
@property (nonatomic, strong) DefaultWebView* webView;
@property (nonatomic, strong) ArticleContentModel* data;


- (instancetype)initWithArticleId:(NSString*)articleId;

@end
