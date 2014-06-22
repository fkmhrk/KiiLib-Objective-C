//
//  KLQueryParamTest.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KLQueryParam.h"
#import "KLClause.h"


@interface KLQueryParamTest : XCTestCase

@end

@implementation KLQueryParamTest

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

- (void)test_0000_all_asc
{
    KLQueryParam *param = [[KLQueryParam alloc] initWithClause:[KLClause all]];
    [param setSortByAsc:@"score"];
    [param setLimit:@12];
    [param setPaginationKey:@"key1122"];
    
    XCTAssertEqualObjects(param.json[@"paginationKey"], @"key1122", @"unexpected key");
    XCTAssertEqualObjects(param.json[@"bucketQuery"][@"orderBy"], @"score", @"unexpected orderBy");
    
    NSNumber *boolVal = param.json[@"bucketQuery"][@"descending"];
    XCTAssertEqualObjects(boolVal, @NO, @"unexpected descending");
}

- (void)test_0001_all_desc
{
    KLQueryParam *param = [[KLQueryParam alloc] initWithClause:[KLClause all]];
    [param setSortByDesc:@"score"];
    [param setLimit:@12];
    [param setPaginationKey:@"key1122"];
    
    XCTAssertEqualObjects(param.json[@"paginationKey"], @"key1122", @"unexpected key");
    XCTAssertEqualObjects(param.json[@"bucketQuery"][@"orderBy"], @"score", @"unexpected orderBy");
    
    NSNumber *boolVal = param.json[@"bucketQuery"][@"descending"];
    XCTAssertEqualObjects(boolVal, @YES, @"unexpected descending");
}

@end
