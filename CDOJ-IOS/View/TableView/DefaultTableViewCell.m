//
//  DefaultTableViewCell.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultTableViewCell.h"
#import "Color.h"

@implementation DefaultTableViewCell

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil]) {
        [self setBackgroundColor:COLOR_BACKGROUND];
    }
    return self;
}

@end
