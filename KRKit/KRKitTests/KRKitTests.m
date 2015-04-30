//
//  KRKitTests.m
//  KRKitTests
//
//  Created by aidenluo on 4/30/15.
//  Copyright (c) 2015 36kr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "KRKit.h"

@interface KRKitTests : XCTestCase

@end

@implementation KRKitTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNSArray
{
    NSArray *array = @[@(1),@(2)];
    XCTAssertEqualObjects([array kr_objectAtIndex:0], @(1));
    XCTAssertNil([array kr_objectAtIndex:2]);
}

- (void)testNSString
{
    NSString *str = @"Hello world!";
    NSLog(@"%@",[str kr_md5]);
    XCTAssertNotNil([str kr_md5]);
}

@end
