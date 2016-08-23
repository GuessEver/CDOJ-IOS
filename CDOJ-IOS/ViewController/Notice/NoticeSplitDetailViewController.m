//
//  NoticeSplitDetailViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "NoticeSplitDetailViewController.h"
#import "ArticleContentViewController.h"

@implementation NoticeSplitDetailViewController

- (instancetype)initWithArticleId:(NSString*)articleId {
    if(self = [super initWithRootViewController:[[ArticleContentViewController alloc] initWithArticleId:articleId]]) {
    }
    return self;
}

@end
