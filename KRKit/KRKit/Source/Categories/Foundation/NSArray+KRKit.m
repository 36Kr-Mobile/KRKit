//
//  NSArray+KRKit.m
//  Pods
//
//  Created by aidenluo on 4/30/15.
//
//

#import "NSArray+KRKit.h"

@implementation NSArray (KRKit)

- (id)kr_firstObject
{
    if (self.count<1) {
        return nil;
    }
    return self[0];
}

- (id)kr_randomObject
{
    if (self.count<1) {
        return nil;
    }
    return self[arc4random() % [self count]];
}

- (id)kr_objectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    return nil;
}

- (BOOL)kr_isEmpty
{
    return [self count] == 0 ? YES : NO;
}

@end
