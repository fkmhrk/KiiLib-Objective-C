//
//  KLHTTPClientFactoryImpl.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import "KLHTTPClientFactoryImpl.h"
#import "KLHTTPClientImpl.h"

@implementation KLHTTPClientFactoryImpl

- (KLHTTPClientFactoryImpl *)initWithSession:(NSURLSession *)session
{
    self = [super init];
    if (self != nil) {
        self.session = session;
    }
    return self;
}

- (id<KLHTTPClient>) newClient
{
    return [[KLHTTPClientImpl alloc] initWithSession:self.session];
}

@end
