//
//  ContestContentViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContestContentModel.h"

@interface ContestContentViewController : UIViewController

@property (nonatomic, strong) NSString* htmlStr;
@property (nonatomic, strong) UIWebView* webView;
@property (nonatomic, strong) ContestContentModel* data;


- (instancetype)initWithContestId:(NSString*)cid;

@end
