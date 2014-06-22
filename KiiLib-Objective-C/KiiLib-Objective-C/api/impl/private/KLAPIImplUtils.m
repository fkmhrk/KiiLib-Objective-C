//
//  KLAppImplUtils.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import "KLAPIImplUtils.h"

@implementation KLAPIImplUtils

+ (void)initClient:(id<KLHTTPClient>)client
               url:(NSString *)url
            method:(NSString *)method
             appID:(NSString *)appID
            appKey:(NSString *)appKey
          andToken:(NSString *)token
{
    [client setURL:url];
    [client setMethod:method];
    [client setHeaderWithKey:@"x-kii-appid" andValue:appID];
    [client setHeaderWithKey:@"x-kii-appkey" andValue:appKey];
    if (token != nil) {
        NSString *val = [NSString stringWithFormat:@"bearer %@", token];
        [client setHeaderWithKey:@"authorization" andValue:val];
    }
}
@end
