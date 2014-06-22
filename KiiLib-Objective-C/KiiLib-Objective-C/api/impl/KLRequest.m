//
//  KLRequest.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import "KLRequest.h"

@implementation KLRequest

- (KLRequest *)initWithURL:(NSString *)url
                    method:(NSString *)method
                     appID:(NSString *)appID
                    appKey:(NSString *)appKey
                  andToken:(NSString *)token
{
    self = [super init];
    if (self != nil) {
        // set headers
        [self setValue:appID forHTTPHeaderField:@"x-kii-appid"];
        [self setValue:appKey forHTTPHeaderField:@"x-kii-appkey"];
        if (token != nil) {
            NSString *value = [NSString stringWithFormat:@"bearer %@", token];
            [self setValue:value forHTTPHeaderField:@"authorization"];
        }
        // set method
        [self setHTTPMethod:method];
        // set url
        [self setURL:[NSURL URLWithString:url]];
    }
    return self;
}


@end
