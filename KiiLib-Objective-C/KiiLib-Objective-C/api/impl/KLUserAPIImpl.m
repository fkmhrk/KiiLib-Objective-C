//
//  KLUserAPIImpl.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import "KLUserAPIImpl.h"
#import "KLUserAPIImpl+private.h"
#import "KLAppAPIImpl.h"
#import "KLRequest.h"

@implementation KLUserAPIImpl

- (KLUserAPIImpl*) initWithApp:(KLAppAPIImpl*)app
{
    self = [super init];
    if (self != nil) {
        self.app = app;
    }
    return self;
}

- (void) signUp:(NSDictionary *)info
   withPassword:(NSString *)password
       andBlock:(void (^)(KLUser *user, NSError *error))block
{
    NSMutableDictionary *info2 = [info mutableCopy];
    info2[@"password"] = password;
    
    NSString *url = [NSString stringWithFormat:@"%@/apps/%@/users", self.app.baseURL, self.app.appID];
    id<KLHTTPClient> client = [self.app.factory newClient];
    [client setURL:url];
    [client setMethod:@"POST"];
    [client setHeaderWithKey:@"x-kii-appid" andValue:self.app.appID];
    [client setHeaderWithKey:@"x-kii-appkey" andValue:self.app.appKey];
    
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:info2 options:NSJSONWritingPrettyPrinted error:&error];
    if (error != nil) {
        return;
    }
    [client setHeaderWithKey:@"content-type" andValue:@"application/json"];
    [client setData:data];
    
    [client sendRequest:^(KLHTTPResponse *response, NSError *error) {
        if (error != nil) {
            block(nil, error);
            return;
        }
        if (response.status < 200 || response.status >= 300) {
            block(nil, [NSError errorWithDomain:@"" code:response.status userInfo:nil]);
            return;
        }
        NSDictionary *json = [response getBodyAsJSON];
        NSLog(@"body is %@", json);
        KLUser *user = [[KLUser alloc] initWithJSON:json];
        block(user, nil);
    }];
}
@end
