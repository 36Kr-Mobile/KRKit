//
//  NSMutableDictionary+KRKit.m
//  Pods
//
//  Created by aidenluo on 4/30/15.
//
//

#import "NSMutableDictionary+KRKit.h"

@implementation NSMutableDictionary (KRKit)

- (void)kr_setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (anObject && aKey) {
        [self setObject:anObject forKey:aKey];
    }
}

@end
