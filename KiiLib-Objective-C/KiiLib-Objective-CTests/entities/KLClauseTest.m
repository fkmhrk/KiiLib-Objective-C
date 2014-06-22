//
//  KLClauseTest.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KLClause.h"

@interface KLClauseTest : XCTestCase

@end

@implementation KLClauseTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_0000_all
{
    KLClause *clause = [KLClause all];
    XCTAssertEqualObjects(clause.json[@"type"], @"all", @"unexpected type");
}

- (void)test_0100_equals
{
    KLClause *clause = [KLClause equalWithField:@"name" andValue:@"fkm"];
    XCTAssertEqualObjects(clause.json[@"type"], @"eq", @"unexpected type");
    XCTAssertEqualObjects(clause.json[@"field"], @"name", @"unexpected type");
    XCTAssertEqualObjects(clause.json[@"value"], @"fkm", @"unexpected type");
}
@end
