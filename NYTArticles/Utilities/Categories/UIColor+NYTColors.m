//
//  UIColor+NYTColors.m
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import "UIColor+NYTColors.h"
#import <HexColors/HexColors.h>

@implementation UIColor (NYTColors)

+ (UIColor *)nyt_navigationBarColor
{
    return [UIColor hx_colorWithHexRGBAString:@"#50e3c2"];
}

@end
