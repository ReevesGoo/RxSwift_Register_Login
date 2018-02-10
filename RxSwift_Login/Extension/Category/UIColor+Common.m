//
//  UIColor+Common.m
//  tsym
//
//  Created by cyyz on 15/4/28.
//  Copyright (c) 2015年 cyyz. All rights reserved.
//

#import "UIColor+Common.h"

@implementation UIColor (Common)

#pragma mark - 16进制颜色(html颜色值)字符串转为UIColor
+ (UIColor *)hexStringToColor: (NSString *) stringToConvert{
    
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 charactersif ([cString length] < 6) return [UIColor blackColor];
    // strip 0X if it appearsif ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

+ (UIColor *)ChColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha{
    
    return [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:alpha];  
}

+ (UIColor *)baseRColor{

    return [UIColor hexStringToColor:@"#ff7272"];
}

+ (UIColor *)baseGColor{
    
    return [UIColor hexStringToColor:@"#00CE70"];
}

+ (UIColor *)baseBColor{
    
    return [UIColor hexStringToColor:@"#4381FD"];
}

+ (UIColor *)baseBlueColor {
    return [UIColor hexStringToColor:@"#26ADC9"];
}

+ (UIColor *)baseGrayColor {
    return [UIColor hexStringToColor:@"#CBC7CC"];
}

+ (UIColor *)baseBlackColor {
    return [UIColor hexStringToColor:@"#333333"];
}

+ (UIColor *)baseWordGrayColor {
    return [UIColor hexStringToColor:@"#878787"];
}
@end
