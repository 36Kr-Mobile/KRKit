//
//  NSObject+KRKit.m
//  Pods
//
//  Created by aidenluo on 4/30/15.
//
//

#import "NSObject+KRKit.h"
#import <objc/runtime.h>

@implementation NSObject (KRKit)

+ (BOOL)kr_swizzleMethod:(SEL)origSel withMethod:(SEL)altSel
{
    Method origMethod = class_getInstanceMethod(self, origSel);
    if (!origMethod) {
        return NO;
    }
    
    Method altMethod = class_getInstanceMethod(self, altSel);
    if (!altMethod) {
        return NO;
    }
    
    class_addMethod(self,
                    origSel,
                    class_getMethodImplementation(self, origSel),
                    method_getTypeEncoding(origMethod));
    class_addMethod(self,
                    altSel,
                    class_getMethodImplementation(self, altSel),
                    method_getTypeEncoding(altMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, origSel), class_getInstanceMethod(self, altSel));
    return YES;
}

+ (BOOL)kr_swizzleClassMethod:(SEL)origSel withClassMethod:(SEL)altSel
{
    return [object_getClass((id)self) kr_swizzleMethod:origSel withMethod:altSel];
}

@end
