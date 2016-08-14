//
//  NoticeSplitDetailViewController.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "NoticeSplitDetailViewController.h"
#import "NoticeContentViewController.h"

@implementation NoticeSplitDetailViewController

- (instancetype)initWithArticleId:(NSString*)articleId {
    if(self = [super initWithRootViewController:[[NoticeContentViewController alloc] initWithArticleId:articleId]]) {
    }
    return self;
}

@end
