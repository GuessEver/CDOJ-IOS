//
//  ProblemContentViewController.h
//  CDOJ-IOS
//
//  Created by Sunnycool on 16/8/8.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProblemContentModel.h"

@interface ProblemContentViewController : UIViewController

@property (nonatomic, strong) NSString* htmlStr;
@property (nonatomic, strong) UIWebView* webView;
@property (nonatomic, strong) ProblemContentModel* data;


- (instancetype)initWithProblemId:(NSString*)pid;

@end
