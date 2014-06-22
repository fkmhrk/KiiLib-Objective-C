//
//  KLHTTPClientImpl.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import "KLHTTPClientImpl.h"

@implementation KLHTTPClientImpl

- (KLHTTPClientImpl *)initWithSession:(NSURLSession *)session;
{
    self = [super init];
    if (self != nil) {
        self.session = session;
        self.request = [[NSMutableURLRequest alloc] init];
    }
    return self;
}


- (void) setURL:(NSString *)url
{
    [self.request setURL:[NSURL URLWithString:url]];
}

- (void) setMethod:(NSString *)method
{
    [self.request setHTTPMethod:method];
}

- (void) setHeaderWithKey:(NSString *)key andValue:(NSString *)value
{
    [self.request setValue:value forHTTPHeaderField:key];
}

- (void) setData:(NSData *)data
{
    [self.request setHTTPBody:data];
}

- (void) sendRequest:(void (^)(KLHTTPResponse *response, NSError *error))block
{
    NSURLSessionTask *task =
        [self.session dataTaskWithRequest:self.request
                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                            if (error != nil) {
                                block(nil, error);
                                return;
                            }
                            NSHTTPURLResponse *resp = (NSHTTPURLResponse *)response;
                            KLHTTPResponse *klResponse = [[KLHTTPResponse alloc] init];
                            klResponse.status = resp.statusCode;
                            klResponse.data = data;
                            block(klResponse, nil);
    }];
    [task resume];
}


@end
