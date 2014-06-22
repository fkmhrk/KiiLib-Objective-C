//
//  KLMockHTTPClientFactory.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLHTTPClientFactory.h"
#import "KLMockHTTPClient.h"

@interface KLMockHTTPClientFactory : NSObject <KLHTTPClientFactory>

- (KLMockHTTPClientFactory *) init;

- (void) setResponse:(KLHTTPResponse *)response;

@property KLMockHTTPClient *client;
@end
