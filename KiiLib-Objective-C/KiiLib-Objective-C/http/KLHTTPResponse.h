//
//  KLHTTPResponse.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLHTTPResponse : NSObject

@property int status;
@property NSData *data;

- (NSDictionary *)getHeaders;

- (NSDictionary *)getBodyAsJSON;

@end
