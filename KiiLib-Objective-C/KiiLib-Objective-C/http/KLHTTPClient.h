//
//  KLHTTPClient.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLHTTPResponse.h"

@protocol KLHTTPClient <NSObject>

- (void) setURL:(NSString *)url;

- (void) setMethod:(NSString *)method;

- (void) setHeaderWithKey:(NSString *)key andValue:(NSString *)value;

- (void) setData:(NSData *)data;

- (void) sendRequest:(void (^)(KLHTTPResponse *response, NSError *error))block;
@end
