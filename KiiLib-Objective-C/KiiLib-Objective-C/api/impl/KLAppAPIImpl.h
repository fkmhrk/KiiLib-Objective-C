//
//  KLAppAPIImpl.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLAppAPI.h"
#import "KLHTTPClientFactory.h"

@interface KLAppAPIImpl : NSObject <KLAppAPI>

-(KLAppAPIImpl*) initWithFactory:(id<KLHTTPClientFactory>)factory
                           AppID:(NSString*)appID
                          appKey:(NSString*)appKey
                      andBaseURL:(NSString*)url;


@property id<KLHTTPClientFactory> factory;
@property NSURLSession *session;
@property NSString *appID;
@property NSString *appKey;
@property NSString *baseURL;

@property NSString *accessToken;
@property id<KLUserAPI> userAPI;
@property id<KLBucketAPI> bucketAPI;
@property id<KLObjectAPI> objectAPI;
@end
