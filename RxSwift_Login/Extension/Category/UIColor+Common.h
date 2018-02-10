//
//  UIColor+Common.h
//  tsym
//
//  Created by cyyz on 15/4/28.
//  Copyright (c) 2015年 cyyz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Common)

/**
 *  将十六进制颜色值转为RGB并输出UIColor
 *
 *  @param stringToConvert 十六进制颜色值
 *
 *  @return UIColor
 */
+ (UIColor *)hexStringToColor: (NSString *) stringToConvert;

+ (UIColor *)ChColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

+ (UIColor *)baseGColor;
+ (UIColor *)baseRColor;
+ (UIColor *)baseBColor;
+ (UIColor *)baseBlackColor;
+ (UIColor *)baseBlueColor;
+ (UIColor *)baseGrayColor;
+ (UIColor *)baseWordGrayColor;
@end
