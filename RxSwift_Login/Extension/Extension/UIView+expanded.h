//
//  viewCategory.h
//  cloud
//
//  Created by jack ray on 11-4-16.
//  Copyright 2011年 oulin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define FlexibleT                   UIViewAutoresizingFlexibleTopMargin
#define FlexibleB                   UIViewAutoresizingFlexibleBottomMargin
#define FlexibleL                   UIViewAutoresizingFlexibleLeftMargin
#define FlexibleR                   UIViewAutoresizingFlexibleRightMargin
#define FlexibleH                   UIViewAutoresizingFlexibleHeight
#define FlexibleW                   UIViewAutoresizingFlexibleWidth

#define FixedMarginT                FlexibleW | FlexibleB
#define FixedMarginB                FlexibleW | FlexibleT
#define FixedMarginL                FlexibleH | FlexibleR
#define FixedMarginR                FlexibleH | FlexibleL
#define FixedHorizental             FlexibleW | FlexibleT | FlexibleB
#define FixedVertical               FlexibleH | FlexibleL | FlexibleR
#define FixedALL                    FlexibleW | FlexibleH
#define FixedCenter                 FlexibleL | FlexibleR | FlexibleT | FlexibleB
/*
||宏            || 含义        ||
||————————————— ||:——————————:||
|| FixedMarginB || 下侧距离固定 ||
|| FixedMarginL || 左侧距离固定 ||
|| FixedMarginR || 右侧距离固定 ||
|| FixedHorizental || 左右距离固定 ||
|| FixedVertical || 上下距离固定 ||
|| FixedALL || 四周距离固定 ||
|| FixedCenter || 居中 ||
 */
@interface UIView(Addition)

@property (nonatomic) CGPoint frameOrigin;
@property (nonatomic) CGSize frameSize;

@property (nonatomic) CGFloat frameX;
@property (nonatomic) CGFloat frameY;

// Setting these modifies the origin but not the size.
@property (nonatomic) CGFloat frameRight;
@property (nonatomic) CGFloat frameBottom;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;

-(BOOL) containsSubView:(UIView *)subView;
-(BOOL) containsSubViewOfClassType:(Class)class;


-(void)roundCorner;
-(void)rotateViewStart;
-(void)rotateViewStop;
//-(void)addSubviews:(UIView *)view,...;

- (void) autoResize:(UIViewAutoresizing) mask;
@end
