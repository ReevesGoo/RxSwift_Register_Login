//
//  UIImageView+SDWebImage.h
//  saidaoyou
//
//  Created by ReevesGoo on 16/3/25.
//  Copyright © 2016年 tm. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <SDWebImage/SDWebImageManager.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface UIImageView (SDWebImage)

- (void)tm_setImageWithURLString:(NSString *)urlString;
- (void)tm_setImageWithURLString:(NSString *)urlString placeholderImage:(UIImage *)placeholder;
- (void)tm_setImageWithURLString:(NSString *)urlString completed:(SDExternalCompletionBlock)completedBlock;
- (void)tm_setImageWithURLString:(NSString *)urlString placeholderImage:(UIImage *)placeholder completed:(SDExternalCompletionBlock)completedBlock;


@end
