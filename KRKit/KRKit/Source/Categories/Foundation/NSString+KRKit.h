//
//  NSString+KRKit.h
//  Pods
//
//  Created by aidenluo on 4/30/15.
//
//

@import Foundation;

@interface NSString (KRKit)

- (NSURL *)kr_convertToURL;
- (NSURL *)kr_convertToURLRelativeToURL:(NSURL*)baseURL;

- (NSString *)kr_md5;
- (NSString *)kr_URLEncode;
- (NSString *)kr_encodeBase64;
- (NSString *)kr_decodeBase64;

- (BOOL)kr_isEmail;
- (BOOL)kr_hasString:(NSString *)substring;
- (BOOL)kr_isNotEmpty;

@end
