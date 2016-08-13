//
//  ColorSchemeModel.m
//  CDOJ-IOS
//
//  Created by GuessEver on 16/8/12.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#import "ColorSchemeModel.h"
#import "Color.h"
#import "LocalDataModel.h"

@implementation ColorSchemeModel

- (instancetype)initWithThemeName:(NSString*)themeName
                        tintColor:(UIColor*)tintColor
                      topBarColor:(UIColor*)topBarColor
                   bottomBarColor:(UIColor*)bottomBarColor
                 backgroundColor1:(UIColor*)backgroundColor1
                 backgroundColor2:(UIColor*)backgroundColor2
                        textColor:(UIColor*)textColor
                     commentColor:(UIColor*)commentColor {
    if(self = [super init]) {
        self.themeName = themeName;
        self.tintColor = tintColor;
        self.topBarColor = topBarColor;
        self.bottomBarColor = bottomBarColor;
        self.backgroundColor1 = backgroundColor1;
        self.backgroundColor2 = backgroundColor2;
        self.textColor = textColor;
        self.commentColor = commentColor;
    }
    return self;
}

+ (NSArray*)colorSchemes {
    return @[
             [[[self class] alloc] initWithThemeName:@"橙"
                                           tintColor:COLOR_ORANGE
                                         topBarColor:COLOR_WHITE
                                      bottomBarColor:COLOR_WHITE
                                    backgroundColor1:COLOR_WHITE
                                    backgroundColor2:COLOR_WHITE
                                           textColor:COLOR_BLACK
                                        commentColor:COLOR_GRAY],
             [[[self class] alloc] initWithThemeName:@"蓝"
                                           tintColor:COLOR_BLUE
                                         topBarColor:COLOR_WHITE
                                      bottomBarColor:COLOR_WHITE
                                    backgroundColor1:COLOR_WHITE
                                    backgroundColor2:COLOR_WHITE
                                           textColor:COLOR_BLACK
                                        commentColor:COLOR_GRAY]
             ];
}
+ (instancetype)defaultColorScheme {
    NSInteger index = [LocalDataModel getDefaultThemeIndex];
    return [[self class] colorSchemes][index];
}

@end
