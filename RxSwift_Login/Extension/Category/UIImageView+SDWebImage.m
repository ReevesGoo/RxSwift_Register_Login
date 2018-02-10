//
//  UIImageView+SDWebImage.m
//  saidaoyou
//
//  Created by ReevesGoo on 16/3/25.
//  Copyright © 2016年 tm. All rights reserved.
//

#import "UIImageView+SDWebImage.h"


#define imageDomainString(lastPath) [NSString stringWithFormat:@"https://ctaa-offic.oss-cn-beijing.aliyuncs.com/%@", lastPath]

@implementation UIImageView (SDWebImage)


//重新封装一层，传NSString值
- (void)tm_setImageWithURLString:(NSString *)urlString {
    
//    NSURL *URLString = [NSURL URLWithString:imageDomainString(urlString)];
    NSURL *URLString = [NSURL URLWithString:urlString];
    [self sd_setImageWithURL:URLString placeholderImage:nil options:SDWebImageHighPriority | SDWebImageRetryFailed progress:nil completed:nil];
}
//重新封装一层，传NSString值
- (void)tm_setImageWithURLString:(NSString *)urlString placeholderImage:(UIImage *)placeholder {
    
//    NSURL *URLString = [NSURL URLWithString:imageDomainString(urlString)];
    NSURL *URLString = [NSURL URLWithString:urlString];
    [self sd_setImageWithURL:URLString placeholderImage:placeholder options:SDWebImageHighPriority | SDWebImageRetryFailed progress:nil completed:nil];
}
//重新封装一层，传NSString值
- (void)tm_setImageWithURLString:(NSString *)urlString completed:(SDExternalCompletionBlock)completedBlock {
    
//    NSURL *URLString = [NSURL URLWithString:imageDomainString(urlString)];
    NSURL *URLString = [NSURL URLWithString:urlString];
    [self sd_setImageWithURL:URLString placeholderImage:nil options:SDWebImageHighPriority | SDWebImageRetryFailed progress:nil completed:completedBlock];
}
//重新封装一层，传NSString值
- (void)tm_setImageWithURLString:(NSString *)urlString placeholderImage:(UIImage *)placeholder completed:(SDExternalCompletionBlock)completedBlock {
    
//    NSURL *URLString = [NSURL URLWithString:imageDomainString(urlString)];
    NSURL *URLString = [NSURL URLWithString:urlString];
    [self sd_setImageWithURL:URLString placeholderImage:placeholder options:SDWebImageHighPriority | SDWebImageRetryFailed progress:nil completed:completedBlock];
}



@end
