//
//  ColorSchemeModel.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/12.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorSchemeModel : NSObject

@property (nonatomic, strong) NSString* themeName;
@property (nonatomic, strong) UIColor* tintColor;
@property (nonatomic, strong) UIColor* topBarColor;
@property (nonatomic, strong) UIColor* bottomBarColor;
@property (nonatomic, strong) UIColor* backgroundColor1;
@property (nonatomic, strong) UIColor* backgroundColor2;
@property (nonatomic, strong) UIColor* textColor;
@property (nonatomic, strong) UIColor* commentColor;
@property (nonatomic, strong) NSDictionary* tagColors;

+ (NSArray<ColorSchemeModel*>*)colorSchemes;
+ (instancetype)defaultColorScheme;

@end
