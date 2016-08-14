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

UIViewController* topViewController();
+ (void)show:(NSString*)message withTitle:(NSString*)title;
+ (void)confirm:(NSString*)message withTitle:(NSString*)title callback:(void (^)())callback;
+ (void)showInputBoxWithPassword:(BOOL)password message:(NSString*)message title:(NSString*)title callback:(void (^)(NSString* text))callback;

@end
