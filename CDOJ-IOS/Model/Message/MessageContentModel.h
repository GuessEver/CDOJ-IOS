//
//  MessageContentModel.h
//  CDOJ-IOS
//
//  Created by GuessEver on 2016/9/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultModel.h"

@interface MessageContentModel : DefaultModel

@property (nonatomic, strong) NSDictionary* content;


- (void)fetchDataWithMessageId:(NSString*)messageId;

@end
