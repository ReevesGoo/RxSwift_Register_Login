//
//  HYBTextView.h
//  museum
//
//  Created by tm on 16/2/20.
//  Copyright © 2016年 thomasho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYBTextView : UITextView
/*!
 * @brief 占位符文本,与UITextField的placeholder功能一致
 */
@property (nonatomic, strong) NSString *placeholder;

/*!
 * @brief 占位符文本颜色
 */
@property (nonatomic, strong) UIColor *placeholderTextColor;
@end
