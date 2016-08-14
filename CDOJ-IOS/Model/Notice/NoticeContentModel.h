//
//  NoticeContentModal.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/12.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DefaultModel.h"

@interface NoticeContentModel : DefaultModel

@property (nonatomic, strong) NSDictionary* content;


- (void)fetchDataWithArticleId:(NSString*)articleId;

@end
