//
//  Message.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "Message.h"

@implementation Message

UIViewController* topViewController() {
    UIViewController* top = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    while(top.presentedViewController) {
        top = top.presentedViewController;
    }
    return top;
}

+ (void)show:(NSString*)message withTitle:(NSString*)title {
    UIAlertController* alertMsg = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"知道了" style:(UIAlertActionStyleDefault) handler:nil];
    [alertMsg addAction:okAction];
    [topViewController() presentViewController:alertMsg animated:YES completion:nil];
}

+ (void)showInputBoxWithPassword:(BOOL)password message:(NSString*)message title:(NSString*)title callback:(void (^)(NSString* text))callback {
    UIAlertController* alertMsg = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        callback(alertMsg.textFields[0].text);
    }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
    [alertMsg addAction:okAction];
    [alertMsg addAction:cancelAction];
    [alertMsg addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        [textField setAutocorrectionType:UITextAutocorrectionTypeNo];
        [textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [textField setSecureTextEntry:password];
    }];
    [topViewController() presentViewController:alertMsg animated:YES completion:nil];
}

@end
