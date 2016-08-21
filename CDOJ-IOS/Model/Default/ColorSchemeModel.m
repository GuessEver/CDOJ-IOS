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
                     commentColor:(UIColor*)commentColor
                        tagColors:(NSDictionary*)tagColors {
    if(self = [super init]) {
        self.themeName = themeName;
        self.tintColor = tintColor;
        self.topBarColor = topBarColor;
        self.bottomBarColor = bottomBarColor;
        self.backgroundColor1 = backgroundColor1;
        self.backgroundColor2 = backgroundColor2;
        self.textColor = textColor;
        self.commentColor = commentColor;
        self.tagColors = tagColors;
    }
    return self;
}

+ (NSDictionary*)defaultTagColors {
    return @{
             // contest status
             @"Pending"     : COLOR_ORANGE,
             @"Running"     : COLOR_RED,
             @"Ended"       : COLOR_GREEN,
             // contest type / permission
             @"Public"      : COLOR_GREEN,
             @"Private"     : COLOR_RED,
             @"DIY"         : COLOR_RED,
             @"Invited"     : COLOR_BLUE,
             @"Onsite"      : COLOR_BLACK,
             // status return type
             @"0"           : COLOR_BLACK,
             @"1"           : COLOR_GREEN,
             @"16"          : COLOR_BLACK,
             @"17"          : COLOR_BLACK,
             @"18"          : COLOR_BLACK,
             @"-1"          : COLOR_RED // for all the other status types
             /*
              OJ_WAIT("Queuing"),                             // 0
              OJ_AC("Accepted"),                              // 1
              OJ_PE("Presentation Error on test $case"),      // 2
              OJ_TLE("Time Limit Exceeded on test $case"),    // 3
              OJ_MLE("Memory Limit Exceeded on test $case"),  // 4
              OJ_WA("Wrong Answer on test $case"),            // 5
              OJ_OLE("Output Limit Exceeded on test $case"),  // 6
              OJ_CE("Compilation Error"),                     // 7
              OJ_RE_SEGV("Runtime Error on test $case"),      // 8
              OJ_RE_FPE("Runtime Error on test $case"),       // 9
              OJ_RE_BUS("Runtime Error on test $case"),       // 10
              OJ_RE_ABRT("Runtime Error on test $case"),      // 11
              OJ_RE_UNKNOWN("Runtime Error on test $case"),   // 12
              OJ_RF("Restricted Function on test $case"),     // 13
              OJ_SE("System Error on test $case"),            // 14
              OJ_RE_JAVA("Runtime Error on test $case"),      // 15
              OJ_JUDGING("Queuing"),                          // 16
              OJ_RUNNING("Running on test $case"),            // 17
              OJ_REJUDGING("Queuing");                        // 18
              */
             };
}

+ (NSArray<ColorSchemeModel*>*)colorSchemes {
    return @[
             [[[self class] alloc] initWithThemeName:@"橙"
                                           tintColor:COLOR_ORANGE
                                         topBarColor:COLOR_WHITE
                                      bottomBarColor:COLOR_WHITE
                                    backgroundColor1:COLOR_WHITE
                                    backgroundColor2:COLOR_WHITE
                                           textColor:COLOR_BLACK
                                        commentColor:COLOR_GRAY
                                           tagColors:[self defaultTagColors]],
             [[[self class] alloc] initWithThemeName:@"蓝"
                                           tintColor:COLOR_BLUE
                                         topBarColor:COLOR_WHITE
                                      bottomBarColor:COLOR_WHITE
                                    backgroundColor1:COLOR_WHITE
                                    backgroundColor2:COLOR_WHITE
                                           textColor:COLOR_BLACK
                                        commentColor:COLOR_GRAY
                                           tagColors:[self defaultTagColors]]
             ];
}
+ (instancetype)defaultColorScheme {
    NSInteger index = [LocalDataModel getDefaultThemeIndex];
    return [[self class] colorSchemes][index];
}

@end
