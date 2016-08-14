//
//  DefaultTextFeild.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/14.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultTextField.h"

@implementation DefaultTextField

- (instancetype)initWithPlaceholder:(NSString*)placeholder isPassword:(BOOL)isPassword withBorder:(BOOL)border {
    if(self = [super init]) {
        [self setPlaceholder:placeholder];
        if(border) {
            [self setBorderStyle:UITextBorderStyleRoundedRect];
        }
        [self setAutocorrectionType:UITextAutocorrectionTypeNo];
        [self setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [self setSecureTextEntry:isPassword];
    }
    return self;
}

@end
