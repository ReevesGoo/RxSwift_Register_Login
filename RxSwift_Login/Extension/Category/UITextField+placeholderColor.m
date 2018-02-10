//
//  UITextField+placeholderColor.m
//  saidaoyou
//
//  Created by ReevesGoo on 16/6/27.
//  Copyright © 2016年 tm. All rights reserved.
//

#import "UITextField+placeholderColor.h"

@implementation UITextField (placeholderColor)


- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    BOOL change = NO;
    //保证有占位文字
    if (self.placeholder == nil) {
        self.placeholder = @" ";
        change = YES;
    }
    //设置占位文字颜色
    [self setValue:placeholderColor forKeyPath:@"placeholderLabel.textColor"];
    
    //恢复原状
    if (change) {
        self.placeholder = nil;
    }
}

-(UIColor *)placeholderColor{
    return [self valueForKey:@"placeholderLabel.textColor"];
}

@end
