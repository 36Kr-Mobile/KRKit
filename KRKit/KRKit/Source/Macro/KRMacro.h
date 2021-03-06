//
//  KRMacro.m
//  KRKit
//
//  Created by aidenluo on 5/7/15.
//  Copyright (c) 2015 36kr. All rights reserved.
//

/**
 *  UI相关
 */
#define KRScreenWidth ([[UIScreen mainScreen]bounds].size.width)
#define KRScreenHeight ([[UIScreen mainScreen]bounds].size.height)
#define KRScreenBounds ([[UIScreen mainScreen] bounds])
#define KRStatusBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define KROnePixelHeight (1.0/[[UIScreen mainScreen] scale])
#define KRScreenScale  ([[UIScreen mainScreen] scale])
#define KRNavigationBarHeight   44.0
#define KRTabBarHeight  49.0

/**
 *  Device相关
 */
#define KRSystemVersionGreaterThan(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define KRSystemVersionEqualTo(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define KRSystemVersionLessThan(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

/**
 *  Log相关
 */
#define KRLog(s, ...) NSLog( @"[%@ %@] %@",NSStringFromClass([self class]), NSStringFromSelector(_cmd),[NSString stringWithFormat:(s), ##__VA_ARGS__] )

/**
 *  路径相关
 */
#define KRUserDocumentDirectoryPath ([NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject])
#define KRUserCacheDirectoryPath ([NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject])

#define KRAppVersion    ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
#define KRAppBuildNumber    ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])
#define KRAppIdentifier ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"])
#define KRAppDisplayName    ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"])
#define KRAppBundleName     ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"])