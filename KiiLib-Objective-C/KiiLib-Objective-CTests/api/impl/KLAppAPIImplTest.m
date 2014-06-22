//
//  KLAppAPIImplTest.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KLAppAPIImpl.h"
#import "KLTestConstants.h"
#import "KLMockHTTPClientFactory.h"

#import "KLHTTPClientFactoryImpl.h"

@interface KLAppAPIImplTest : XCTestCase

@property(atomic) bool done;
@property(atomic) NSString *token;
@property(atomic) KLUser *user;
@property(atomic) NSError *error;

@end

@implementation KLAppAPIImplTest

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


- (void) test_0000_Login_Facebook {
    KLMockHTTPClientFactory *factory = [[KLMockHTTPClientFactory alloc] init];
    id<KLAppAPI> api = [[KLAppAPIImpl alloc] initWithFactory:factory
                                                       AppID:@"appID"
                                                      appKey:@"appKey"
                                                  andBaseURL:@"https://api-jp.kii.com/api"];
    KLHTTPResponse *resp = [self createResponse:201 json:@{@"id" : @"user1234", @"access_token" : @"token1234"}];
    [factory setResponse:resp];
    
    self.done = false;
    [api loginFacebook:@"accessToken" withBlock:^(NSString *token, KLUser *user, NSError *error) {
        self.done = true;
        self.token = token;
        self.user = user;
        self.error = error;
    }];
    
    XCTAssertTrue(self.done);
    XCTAssertNotNil(self.user, @"user must not be nil");
    XCTAssertNotNil(self.token, @"token must not be nil");
    XCTAssertNil(self.error, @"error happends");
    
    XCTAssertEqualObjects(self.token, @"token1234", @"unexpected access token");
    XCTAssertEqualObjects(self.user.id, @"user1234", @"unexpected user ID");
}

- (void) test_0100_Login_Twitter {
    KLMockHTTPClientFactory *factory = [[KLMockHTTPClientFactory alloc] init];
    id<KLAppAPI> api = [[KLAppAPIImpl alloc] initWithFactory:factory
                                                       AppID:@"appID"
                                                      appKey:@"appKey"
                                                  andBaseURL:@"https://api-jp.kii.com/api"];
    KLHTTPResponse *resp = [self createResponse:201 json:@{@"id" : @"user1234", @"access_token" : @"token1234"}];
    [factory setResponse:resp];
    
    self.done = false;
    [api loginTwitter:@"accessToken" tokenSecret:@"secret" withBlock:^(NSString *token, KLUser *user, NSError *error) {
        self.done = true;
        self.token = token;
        self.user = user;
        self.error = error;
    }];
    
    XCTAssertTrue(self.done);
    XCTAssertNotNil(self.user, @"user must not be nil");
    XCTAssertNotNil(self.token, @"token must not be nil");
    XCTAssertNil(self.error, @"error happends");
    
    XCTAssertEqualObjects(self.token, @"token1234", @"unexpected access token");
    XCTAssertEqualObjects(self.user.id, @"user1234", @"unexpected user ID");
}

@end
