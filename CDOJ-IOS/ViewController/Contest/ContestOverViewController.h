//
//  ContestOverViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProblemContentModel.h"
#import "DefaultWebView.h"

@interface ContestOverViewController : UIViewController

@property (nonatomic, strong) NSString* htmlStr;
@property (nonatomic, strong) NSDictionary* data;
@property (nonatomic, strong) DefaultWebView* webView;


- (void)loadDetailWithData:(NSDictionary*)data;

@end
