//
//  NSArray+KRKit.m
//  Pods
//
//  Created by aidenluo on 4/30/15.
//
//

#import "NSArray+KRKit.h"

@implementation NSArray (KRKit)

- (id)kr_objectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    return nil;
}

@end
