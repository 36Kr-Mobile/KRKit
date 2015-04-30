//
//  NSMutableArray+KRKit.m
//  Pods
//
//  Created by aidenluo on 4/30/15.
//
//

#import "NSMutableArray+KRKit.h"

@implementation NSMutableArray (KRKit)

- (void)kr_addObject:(id)anObject
{
    if (anObject) {
        [self addObject:anObject];
    }
}

@end
