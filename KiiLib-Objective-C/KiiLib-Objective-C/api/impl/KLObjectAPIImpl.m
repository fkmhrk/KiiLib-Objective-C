//
//  KLObjectAPIImpl.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import "KLObjectAPIImpl.h"
#import "KLHTTPClient.h"

#import "KLAPIImplUtils.h"

@implementation KLObjectAPIImpl

- (KLObjectAPIImpl*) initWithApp:(KLAppAPIImpl*)app
{
    self = [super init];
    if (self != nil) {
        self.app = app;
    }
    return self;
}


- (void) create:(NSDictionary *)data
         bucket:(KLBucket *)bucket
      withBlock:(void (^)(KLObject *obj, NSError *error))block
{
    NSString *url = [NSString stringWithFormat:@"%@/apps/%@%@/objects", self.app.baseURL, self.app.appID, [bucket getResourcePath]];
    
    id<KLHTTPClient> client = [self.app.factory newClient];
    [KLAPIImplUtils initClient:client
                           url:url
                        method:@"POST"
                         appID:self.app.appID
                        appKey:self.app.appKey
                      andToken:self.app.accessToken];
    
    NSError *error = nil;
    NSData *rawData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:&error];
    if (error != nil) {
        block(nil, error);
        return;
    }
    [client setHeaderWithKey:@"content-type" andValue:@"application/json"];
    [client setData:rawData];
    
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
        if (json == nil) {
            block(nil, [NSError errorWithDomain:@"" code:response.status userInfo:nil]);
            return;
        }
        NSString *objID = json[@"objectID"];
        KLObject *obj = [[KLObject alloc] initWithBucket:bucket andID:objID];
        [obj updateWithJSON:data];
        block(obj, nil);
    }];

  
}
@end
