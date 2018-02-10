//
//  NSDictionaryCategory.m
//  cloud
//
//  Created by hetao on 11-4-19.
//  Copyright 2011年 oulin. All rights reserved.
//

#import "NSDictionary+expanded.h"


@implementation NSDictionary (expanded)

- (id)objectForJSONKey:(id)aKey
{
    id value = [self objectForKey:aKey];
    if (!value||value==[NSNull null]) {
        return nil;
    }else{
        if ([value isKindOfClass:[NSNumber class]]) {
            return [NSString stringWithFormat:@"%@",value];
        }
        else if([value isKindOfClass:[NSString class]]){
            if ([value isEqualToString:@""] || [value isEqualToString:@"null"]) {
                return  nil;
            }
        }
        return value;
    }
}

- (NSString*)valueForJSONStrKey:(NSString *)key
{
    return [self valueForJSONKey:key]?:@"";
}
- (id)valueForJSONKey:(NSString *)key
{
    id value = [self valueForKey:key];
    if (!value||value==[NSNull null]) {
        return nil;
    }else{
        if ([value isKindOfClass:[NSNumber class]]) {
            return [NSString stringWithFormat:@"%@",value];
        }else if([value isKindOfClass:[NSString class]]){
            if ([value isEqualToString:@""] || [value isEqualToString:@"null"] || [value isEqualToString:@"<null>"]) {
                return  nil;
            }
        }
        return value;
    }
}

- (id)valueForJSONStrKeys:(NSString *)key,...NS_REQUIRES_NIL_TERMINATION
{
    id object=[self valueForJSONKey:key];
    NSString *akey;
    va_list ap;
    va_start(ap, key);
    while (object&&(akey=va_arg(ap,id))) {
        object=[object valueForJSONKey:akey];
    }
    va_end(ap);
    return object?object:@"";
}

- (id)valueForJSONKeys:(NSString *)key,...NS_REQUIRES_NIL_TERMINATION
{
    id object=[self valueForJSONKey:key];
    NSString *akey;
    va_list ap;
    va_start(ap, key);
    while (object&&(akey=va_arg(ap,id))) {
        object=[object valueForJSONKey:akey];
    }
    va_end(ap);
    return object;
}
//always return an array
- (void)setObjects:(id)objects forKey:(id)aKey
{
    if (!aKey || !objects || ![self isKindOfClass:[NSMutableDictionary class]]) {
        return;
    }
    if ([self objectForKey:aKey]) {
        NSMutableArray *array = [NSMutableArray arrayWithArray:[self objectForKey:aKey]];
        [array addObject:objects];
        [(NSMutableDictionary*)self setObject:array forKey:aKey];
    }
    else
    {
        [(NSMutableDictionary*)self setObject:[NSMutableArray arrayWithObject:objects] forKey:aKey];
    }
}
- (void)removeObject:(id)object forKey:(id)aKey
{
    if (!aKey || ![self isKindOfClass:[NSMutableDictionary class]]) {
        return;
    }
    if ([self objectForKey:aKey]) {
        NSMutableArray *array = [NSMutableArray arrayWithArray:[self objectForKey:aKey]];
        [array removeObject:object];
        if (array.count) {
            [(NSMutableDictionary*)self setObject:array forKey:aKey];
        }else{
            [(NSMutableDictionary*)self removeObjectForKey:aKey];
        }
    }
}
@end
