//
//  KLAppAPI.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLUser.h"
#import "KLUserAPI.h"
#import "KLBucketAPI.h"
#import "KLObjectAPI.h"

@protocol KLAppAPI <NSObject>

- (void) loginFacebook:(NSString*)token withBlock:(void (^)(NSString *token, KLUser *user, NSError *error))block;

- (void) loginTwitter:(NSString*)accessToken tokenSecret:(NSString*)accessTokenSecret
            withBlock:(void (^)(NSString *token, KLUser *user, NSError *error))block;

@property NSString *accessToken;
@property id<KLUserAPI> userAPI;
@property id<KLBucketAPI> bucketAPI;
@property id<KLObjectAPI> objectAPI;

@end
