//
//  ProgressBar.h
//  CDOJ-IOS
//
//  Created by GuessEver on 2016/9/24.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressBar : UIView

@property (nonatomic, strong) UIView* processing;

- (instancetype)initWithParent:(__weak __kindof UIView*)parent withKeyPath:(NSString*)keyPath;

@end
