//
//  NSArray+KRKit.h
//  Pods
//
//  Created by aidenluo on 4/30/15.
//
//

@import Foundation;

@interface NSArray (KRKit)

- (id)kr_firstObject;
- (id)kr_randomObject;
- (id)kr_objectAtIndex:(NSUInteger)index;

- (BOOL)kr_isEmpty;

@end
