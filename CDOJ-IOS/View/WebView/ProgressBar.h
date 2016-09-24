//
//  ProgressBar.h
//  CDOJ-IOS
//
//  Created by GuessEver on 2016/9/24.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressBar : UIView

@property (nonatomic) BOOL hideAfterDone;
@property (nonatomic) double progress;
@property (nonatomic, strong) NSTimer* autoProgressTimer;

- (instancetype)initWithParent:(__weak id)parent inView:(__weak __kindof UIView*)parentView withKeyPath:(NSString*)keyPath loadingIncreasement:(BOOL)loadingIncreasement;
- (instancetype)initWithParent:(__weak id)parent inView:(__weak __kindof UIView*)parentView withKeyPath:(NSString*)keyPath;

@end
