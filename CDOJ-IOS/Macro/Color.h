//
//  Color.h
//  CDOJ-IOS
//
//  Created by GuessEver on 16/5/12.
//  Copyright © 2016年 UESTCACM QKTeam. All rights reserved.
//

#ifndef Color_h
#define Color_h


// RGB
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r, g, b) RGBA(r, g, b, 1.0)

// Main colors
#define COLOR_BLACK RGB(0, 0, 0)
#define COLOR_WHITE RGB(255, 255, 255)
#define COLOR_WHITESMOKE RGB(249, 249, 249)

#define COLOR_BLUE RGB(72, 133, 237)
#define COLOR_LIGHTBLUE RGB(234, 247, 253)
#define COLOR_BRIGHTBLUE RGB(6, 201, 247)

#define COLOR_RED RGB(219, 50, 54)

#define COLOR_GREEN RGB(60, 186, 84)

#define COLOR_YELLOW RGB(244, 194, 13)
#define COLOR_ORANGE RGB(243, 152, 0)
#define COLOR_LIGHTORANGE RGB(251, 244, 231)
#define COLOR_BRIGHTORANGE RGB(251, 194, 89)

#define COLOR_GRAY [UIColor grayColor]
#define COLOR_LIGHTGRAY RGB(220, 220, 220)


#endif /* Color_h */
