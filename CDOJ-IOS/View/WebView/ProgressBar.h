//
//  ProgressBar.h
//  CDOJ-IOS
//
//  Created by GuessEver on 2016/9/24.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressBar : UIView

- (instancetype)initWithParent:(__weak id)parent inView:(__weak __kindof UIView*)parentView withKeyPath:(NSString*)keyPath;

@end
