//
//  NSString+KRKit.m
//  Pods
//
//  Created by aidenluo on 4/30/15.
//
//

#import "NSString+KRKit.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (KRKit)

- (NSURL *)kr_convertToURL
{
    if (self) {
        return [NSURL URLWithString:self];
    }else {
        return nil;
    }
}

- (NSURL *)kr_convertToURLRelativeToURL:(NSURL*)baseURL
{
    if(!baseURL) {
        return nil;
    } else {
        return [NSURL URLWithString:self relativeToURL:baseURL];
    }
}

- (NSString *)kr_md5
{
    unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
    CC_MD5([self UTF8String], (uint32_t)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for (i=0;i<CC_MD5_DIGEST_LENGTH;i++) {
        [ms appendFormat: @"%02x", (int)(digest[i])];
    }
    return [ms copy];
}

@end
