//
//  DefaultPageController.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/9.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "TYTabButtonPagerController.h"
#import "ColorSchemeModel.h"

@interface DefaultPageController : TYTabButtonPagerController <TYPagerControllerDataSource, TYTabPagerControllerDelegate>

@property (nonatomic, strong) NSString* url;
- (void)loadWebActionBarButtonsWithUrl:(NSString*)url;

@end
