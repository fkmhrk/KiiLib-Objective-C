//
//  KLBucketAPIImpl.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import "KLBucketAPIImpl.h"
#import "KLAPIImplUtils.h"

@implementation KLBucketAPIImpl

- (KLBucketAPIImpl*) initWithApp:(KLAppAPIImpl*)app
{
    self = [super init];
    if (self != nil) {
        self.app = app;
    }
    return self;
}

- (void) queryWithBucket:(KLBucket *)bucket
                   param:(KLQueryParam *)param
                andBlock:(void (^)(NSArray *result, NSString *paginationKey, NSError *error)) block
{
    NSString *url = [NSString stringWithFormat:@"%@/apps/%@%@/query",
                     self.app.baseURL,
                     self.app.appID,
                     [bucket getResourcePath]];
    
    id<KLHTTPClient> client = [self.app.factory newClient];
    [KLAPIImplUtils initClient:client
                           url:url
                        method:@"POST"
                         appID:self.app.appID
                        appKey:self.app.appKey
                      andToken:self.app.accessToken];
    
    NSError *error = nil;
    NSData *rawData = [NSJSONSerialization dataWithJSONObject:param.json options:NSJSONWritingPrettyPrinted error:&error];
    if (error != nil) {
        block(nil, nil, error);
        return;
    }
    [client setHeaderWithKey:@"content-type" andValue:@"application/vnd.kii.QueryRequest+json"];
    [client setData:rawData];
    
    [client sendRequest:^(KLHTTPResponse *response, NSError *error) {
        if (error != nil) {
            block(nil, nil, error);
            return;
        }
        if (response.status < 200 || response.status >= 300) {
            block(nil, nil, [NSError errorWithDomain:@"" code:response.status userInfo:nil]);
            return;
        }
        NSDictionary *json = [response getBodyAsJSON];
        if (json == nil) {
            block(nil, nil, [NSError errorWithDomain:@"" code:response.status userInfo:nil]);
            return;
        }
        NSArray *results = json[@"results"];
        NSMutableArray *objArray = [[NSMutableArray alloc] initWithCapacity:results.count];
        for (NSDictionary *item in results) {
            NSString *objID = item[@"_id"];
            KLObject *obj = [[KLObject alloc] initWithBucket:bucket andID:objID];
            [obj updateWithJSON:item];
            [objArray addObject:obj];
        }
        NSString *nextPaginationKey = json[@"nextPaginationKey"];
        block(objArray, nextPaginationKey, nil);
    }];
}

@end
