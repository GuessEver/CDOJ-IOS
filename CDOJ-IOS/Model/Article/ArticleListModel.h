//
//  ArticleListModel.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/12.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DefaultListModel.h"

@interface ArticleListModel : DefaultListModel

@property (nonatomic, strong) NSString* requestUrl;
@property (nonatomic, strong) NSMutableDictionary* requestBody;

- (instancetype)initWithNoticeList;
- (instancetype)initWithBlogListWithUsername:(NSString*)username;
- (instancetype)initWithCommentListInContest:(NSString*)contestId;

@end
