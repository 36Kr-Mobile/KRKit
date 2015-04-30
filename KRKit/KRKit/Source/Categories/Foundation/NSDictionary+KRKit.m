//
//  NSDictionary+KRKit.m
//  Pods
//
//  Created by aidenluo on 4/30/15.
//
//

#import "NSDictionary+KRKit.h"

@implementation NSDictionary (KRKit)

- (BOOL)kr_containsObjectForKey:(id)key
{
    return [[self allKeys] containsObject:key];
}

- (BOOL)kr_isEmpty
{
    return [self count] == 0 ? YES : NO;
}

@end
