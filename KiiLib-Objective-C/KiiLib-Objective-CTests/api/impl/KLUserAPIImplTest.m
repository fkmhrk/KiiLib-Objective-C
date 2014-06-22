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

@interface KLUserAPIImplTest : XCTestCase

@property(atomic) bool done;
@property(atomic) KLUser *user;
@property(atomic) NSError *error;

@end

@implementation KLUserAPIImplTest

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


- (void) test_0000_SignUp {
    KLMockHTTPClientFactory *factory = [[KLMockHTTPClientFactory alloc] init];
    id<KLAppAPI> api = [[KLAppAPIImpl alloc] initWithFactory:factory
                                                       AppID:@"appID"
                                                      appKey:@"appKey"
                                                  andBaseURL:@"https://api-jp.kii.com/api"];
    NSMutableDictionary *info = [@{@"emailAddress" : @"test@test.com"} mutableCopy];
    NSString *password = @"password1234";
    
    KLHTTPResponse *resp = [self createResponse:201 json:@{@"userID" : @"user1234"}];
    [factory setResponse:resp];
    
    self.done = false;
    [api.userAPI signUp:info withPassword:password andBlock:^(KLUser *user, NSError *error) {
        self.done = true;
        self.user = user;
        self.error = error;
    }];
    
    XCTAssertTrue(self.done);
    XCTAssertNotNil(self.user, @"user must not be nil");
    XCTAssertNil(self.error, @"error happends");
    
    XCTAssertEqualObjects(self.user.id, @"user1234", @"user ID must be user1234");
}

@end
