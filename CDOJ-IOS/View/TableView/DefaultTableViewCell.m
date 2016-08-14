//
//  DefaultTableViewCell.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "DefaultTableViewCell.h"

@implementation DefaultTableViewCell

- (instancetype)init {
    if(self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil]) {
        [self setBackgroundColor:[ColorSchemeModel defaultColorScheme].backgroundColor1];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setBackgroundColor:[ColorSchemeModel defaultColorScheme].backgroundColor1];
    }
    return self;
}

@end
