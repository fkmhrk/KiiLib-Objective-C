//
//  KLAppAPIImpl.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import "KLAppAPIImpl.h"
#import "KLUserAPIImpl+private.h"
#import "KLBucketAPIImpl+private.h"
#import "KLObjectAPIImpl+private.h"
#import "KLRequest.h"

#import "KLAPIImplUtils.h"
@implementation KLAppAPIImpl

-(KLAppAPIImpl*) initWithFactory:(id<KLHTTPClientFactory>)factory
                           AppID:(NSString*)appID
                          appKey:(NSString*)appKey
                      andBaseURL:(NSString*)url
{
    self = [super init];
    if (self != nil) {
        self.factory = factory;
        self.appID = appID;
        self.appKey = appKey;
        self.baseURL = url;
        
        self.userAPI = [[KLUserAPIImpl alloc] initWithApp:self];
        self.bucketAPI = [[KLBucketAPIImpl alloc] initWithApp:self];
        self.objectAPI = [[KLObjectAPIImpl alloc] initWithApp:self];
    }
    return self;
}


- (void) loginFacebook:(NSString*)token
             withBlock:(void (^)(NSString *token, KLUser *user, NSError *error))block
{
    NSString *url = [NSString stringWithFormat:@"%@/apps/%@/integration/facebook", self.baseURL, self.appID];
    NSDictionary *json = @{@"accessToken" : token};
    
    [self loginSNSWithURL:url
                     json:json
              contentType:@"application/vnd.kii.AuthTokenFacebookRequest+json"
                 andBlock:block];
}

- (void) loginTwitter:(NSString*)accessToken
          tokenSecret:(NSString*)accessTokenSecret
            withBlock:(void (^)(NSString *token, KLUser *user, NSError *error))block
{
    NSString *url = [NSString stringWithFormat:@"%@/apps/%@/integration/twitter", self.baseURL, self.appID];
    NSDictionary *json = @{
                           @"accessToken" : accessToken,
                           @"accessTokenSecret" : accessTokenSecret
                           };
    
    [self loginSNSWithURL:url
                     json:json
              contentType:@"application/vnd.kii.AuthTokenTwitterRequest+json"
                 andBlock:block];
}

- (void) loginSNSWithURL:(NSString *)url
                    json:(NSDictionary *)json
             contentType:(NSString *)contentType
                andBlock:(void (^)(NSString *token, KLUser *user, NSError *error))block
{
    id<KLHTTPClient> client = [self.factory newClient];
    [KLAPIImplUtils initClient:client
                           url:url
                        method:@"POST"
                         appID:self.appID
                        appKey:self.appKey
                      andToken:self.accessToken];
    
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:&error];
    if (error != nil) {
        block(nil, nil, error);
        return;
    }
    [client setHeaderWithKey:@"content-type" andValue:contentType];
    [client setData:data];

    
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
        NSString *userID = json[@"id"];
        NSString *token = json[@"access_token"];
        self.accessToken = token;
        KLUser *user = [[KLUser alloc] initWithID:userID];
        block(token, user, nil);
    }];
}


@end
