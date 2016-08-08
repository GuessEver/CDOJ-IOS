//
//  Message.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Message : NSObject

+ (void)show:(NSString*)message withTitle:(NSString*)title;
+ (void)showInputBoxWithMessage:(NSString*)message title:(NSString*)title callback:(void (^)(NSString* text))callback;

@end
