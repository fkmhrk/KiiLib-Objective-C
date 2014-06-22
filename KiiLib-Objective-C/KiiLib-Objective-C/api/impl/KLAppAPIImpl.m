//
//  KLAppAPIImpl.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import "KLAppAPIImpl.h"
#import "KLUserAPIImpl+private.h"
#import "KLRequest.h"

@implementation KLAppAPIImpl

-(KLAppAPIImpl*) initWithSession:(NSURLSession *)session
                           AppID:(NSString *)appID
                          appKey:(NSString *)appKey
                      andBaseURL:(NSString *)url
{
    self = [super init];
    if (self != nil) {
        self.session = session;
        self.appID = appID;
        self.appKey = appKey;
        self.baseURL = url;
        
        self.userAPI = [[KLUserAPIImpl alloc] initWithApp:self];
    }
    return self;
}

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
    }
    return self;
}


- (void) loginFacebook:(NSString*)token
             withBlock:(void (^)(NSString *token, KLUser *user, NSError *error))block
{
    
}

- (void) loginTwitter:(NSString*)accessToken
          tokenSecret:(NSString*)accessTokenSecret
            withBlock:(void (^)(NSString *token, KLUser *user, NSError *error))block
{
//    '{"accessToken": "{ACCESS_TOKEN_PROVIDED_BY_TWITTER}","accessTokenSecret": "{ACCESS_SECRET_PROVIDED_BY_TWITTER}"}';
    NSDictionary *json = @{
                           @"accessToken" : accessToken,
                           @"accessTokenSecret" : accessTokenSecret
                           };
    
}

@end
