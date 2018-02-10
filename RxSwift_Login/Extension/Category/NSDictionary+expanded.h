//
//  NSDictionaryCategory.h
//  cloud
//
//  Created by hetao on 11-4-19.
//  Copyright 2011年 oulin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (expanded)

- (id)objectForJSONKey:(id)aKey;
- (id)valueForJSONKey:(NSString *)key;
- (id)valueForJSONKeys:(NSString *)key,...NS_REQUIRES_NIL_TERMINATION;
- (id)valueForJSONStrKeys:(NSString *)key,...NS_REQUIRES_NIL_TERMINATION;
- (void)setObjects:(id)objects forKey:(id)aKey;

- (NSString*)valueForJSONStrKey:(NSString *)key;
- (void)removeObject:(id)object forKey:(id)aKey;

@end
