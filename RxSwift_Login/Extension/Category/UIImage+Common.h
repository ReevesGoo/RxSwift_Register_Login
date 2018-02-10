//
//  UIImage+Common.h
//  tsym
//
//  Created by cyyz on 15/4/29.
//  Copyright (c) 2015年 cyyz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Common)

+ (UIImage *)imageWithColor:(UIColor *)aColor;

+ (UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame;

+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

+ (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize WithSorceImage:(UIImage *)sourceImage;

@end
