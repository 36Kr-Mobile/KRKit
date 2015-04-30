//
//  NSString+KRKit.h
//  Pods
//
//  Created by aidenluo on 4/30/15.
//
//

#import <Foundation/Foundation.h>

@interface NSString (KRKit)

- (NSURL *)kr_convertToURL;
- (NSURL *)kr_convertToURLRelativeToURL:(NSURL*)baseURL;

- (NSString *)kr_md5;

@end
