//
//  KLBucketAPIImplTest.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KLAppAPIImpl.h"
#import "KLTestConstants.h"
#import "KLMockHTTPClientFactory.h"


@interface KLBucketAPIImplTest : XCTestCase

@property(atomic) bool done;
@property(atomic) NSArray *list;
@property(atomic) NSString *nextPaginationKey;
@property(atomic) NSError *error;

@end

@implementation KLBucketAPIImplTest

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

- (KLHTTPResponse *)createResponse:(int)status json:(NSDictionary *)json
{
    KLHTTPResponse *response = [[KLHTTPResponse alloc] init];
    response.status = status;
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:&error];
    if (error != nil) {
        XCTFail(@"failed to create response");
    }
    response.data = data;
    return response;
}


- (void) test_0000_Query {
    KLMockHTTPClientFactory *factory = [[KLMockHTTPClientFactory alloc] init];
    id<KLAppAPI> api = [[KLAppAPIImpl alloc] initWithFactory:factory
                                                       AppID:@"appID"
                                                      appKey:@"appKey"
                                                  andBaseURL:@"https://api-jp.kii.com/api"];
    
    KLBucket *bucket = [[KLBucket alloc] initWithOwner:nil andName:@"board"];
    KLQueryParam *param = [[KLQueryParam alloc] initWithClause:[KLClause all]];
    
    KLHTTPResponse *resp = [self createResponse:201 json:@{@"results" : @[
                                                                   @{@"_id" : @"obj1234"},
                                                                   @{@"_id" : @"obj5678", @"name" : @"fkm"},
                                                                   ]}];
    [factory setResponse:resp];
    
    self.done = false;
    [api.bucketAPI queryWithBucket:bucket
                             param:param
                          andBlock:^(NSArray *result, NSString *paginationKey, NSError *error) {
                              self.done = true;
                              self.list = result;
                              self.nextPaginationKey = paginationKey;
                              self.error = error;
                          }];
    
    XCTAssertTrue(self.done);
    XCTAssertNotNil(self.list, @"obj must not be nil");
    XCTAssertNil(self.nextPaginationKey, @"nextPaginationKey must be nil");
    XCTAssertNil(self.error, @"error happends");
    
    XCTAssertEqual(self.list.count, 2, @"unexpected list count");
    KLObject *obj = self.list[0];
    XCTAssertEqual(obj.count, 1, @"unexpected count");
    XCTAssertEqualObjects(obj.id, @"obj1234", @"unexpected object ID");
    
    obj = self.list[1];
    XCTAssertEqual(obj.count, 2, @"unexpected count");
    XCTAssertEqualObjects(obj.id, @"obj5678", @"unexpected object ID");
    XCTAssertEqualObjects(obj[@"name"], @"fkm", @"unexpected field");

}

- (void) test_0001_Query_nextPaginationKey {
    KLMockHTTPClientFactory *factory = [[KLMockHTTPClientFactory alloc] init];
    id<KLAppAPI> api = [[KLAppAPIImpl alloc] initWithFactory:factory
                                                       AppID:@"appID"
                                                      appKey:@"appKey"
                                                  andBaseURL:@"https://api-jp.kii.com/api"];
    
    KLBucket *bucket = [[KLBucket alloc] initWithOwner:nil andName:@"board"];
    KLQueryParam *param = [[KLQueryParam alloc] initWithClause:[KLClause all]];
    
    KLHTTPResponse *resp = [self createResponse:201 json:@{@"results" : @[
                                                                   @{@"_id" : @"obj1234"},
                                                                   @{@"_id" : @"obj5678", @"name" : @"fkm"},
                                                                   ],
                                                           @"nextPaginationKey" : @"key1234"}];
    [factory setResponse:resp];
    
    self.done = false;
    [api.bucketAPI queryWithBucket:bucket
                             param:param
                          andBlock:^(NSArray *result, NSString *paginationKey, NSError *error) {
                              self.done = true;
                              self.list = result;
                              self.nextPaginationKey = paginationKey;
                              self.error = error;
                          }];
    
    XCTAssertTrue(self.done);
    XCTAssertNotNil(self.list, @"obj must not be nil");
    XCTAssertNotNil(self.nextPaginationKey, @"nextPaginationKey must be nil");
    XCTAssertNil(self.error, @"error happends");
    
    XCTAssertEqual(self.list.count, 2, @"unexpected list count");
    XCTAssertEqualObjects(self.nextPaginationKey, @"key1234", @"unexpected key");
}

@end
