//
//  MainViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITabBarController
@property (nonatomic, strong) UIView* networkConnectionErrorTipBar;
@property NSInteger numberOfNetworkConnections;

@end
