//
//  KLHTTPClientImpl.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLHTTPClient.h"

@interface KLHTTPClientImpl : NSObject <KLHTTPClient>

- (KLHTTPClientImpl *)initWithSession:(NSURLSession *)session;

@property NSURLSession *session;
@property NSMutableURLRequest *request;
@end
