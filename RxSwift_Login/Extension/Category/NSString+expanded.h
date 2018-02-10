//
//  StringRef.h
//  beta1
//
//  Created by jack ray on 11-1-17.
//  Copyright 2011 重庆奥芬多网络科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface NSString(expanded) 

-(NSString*)replaceControlString;

- (BOOL)notEmptyOrNull;
+ (NSString *)replaceEmptyOrNull:(NSString *)checkString;
-(NSString*)replaceTime;
-(NSString*)replaceStoreKey;
- (NSString*)soapMessage:(NSString *)key,...;
- (NSString *)md5;
- (NSString *)sha1;

//获取 bundle version版本号

+(NSString*) getLocalAppVersion;
//获取BundleID

+(NSString*) getBundleID;

//获取app的名字

+(NSString*) getAppName;

@end
