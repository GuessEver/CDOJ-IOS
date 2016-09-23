//
//  MessageListModel.h
//  CDOJ-IOS
//
//  Created by GuessEver on 2016/9/23.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultListModel.h"
#import "UserModel.h"

@interface MessageListModel : DefaultListModel

- (void)setOpenStatus:(BOOL)isOpen atIndex:(NSInteger)index;

@end
