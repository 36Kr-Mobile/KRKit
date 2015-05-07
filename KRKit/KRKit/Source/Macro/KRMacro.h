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