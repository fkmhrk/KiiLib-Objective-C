//
//  KLMockHTTPClientFactory.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import "KLMockHTTPClientFactory.h"
#import "KLMockHTTPClient.h"

@implementation KLMockHTTPClientFactory

- (KLMockHTTPClientFactory *) init
{
    self = [super init];
    if (self != nil) {
        self.client = [[KLMockHTTPClient alloc] init];
    }
    return self;
}

- (id<KLHTTPClient>) newClient
{
    return self.client;
}

- (void) setResponse:(KLHTTPResponse *)response
{
    self.client.response = response;
}

@end
