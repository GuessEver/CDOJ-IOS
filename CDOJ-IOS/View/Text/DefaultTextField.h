//
//  DefaultTextFeild.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DefaultTextField : UITextField

- (instancetype)initWithPlaceholder:(NSString*)placeholder isPassword:(BOOL)isPassword withBorder:(BOOL)border;

@end
