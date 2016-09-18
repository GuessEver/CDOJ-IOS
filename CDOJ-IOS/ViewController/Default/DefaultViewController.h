//
//  DefaultViewController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorSchemeModel.h"
#import "Masonry.h"

@interface DefaultViewController : UIViewController

@property (nonatomic, strong) NSString* url;
- (void)loadWebActionBarButtonsWithUrl:(NSString*)url;

@end
