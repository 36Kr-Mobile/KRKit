//
//  NSObject+KRKit.h
//  Pods
//
//  Created by aidenluo on 4/30/15.
//
//

@import Foundation;

@interface NSObject (KRKit)

+ (BOOL)kr_swizzleMethod:(SEL)origSel withMethod:(SEL)altSel;
+ (BOOL)kr_swizzleClassMethod:(SEL)origSel withClassMethod:(SEL)altSel;

@end
