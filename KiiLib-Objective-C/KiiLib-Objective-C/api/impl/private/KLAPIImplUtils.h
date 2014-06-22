//
//  KLAppImplUtils.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLHTTPClient.h"
@interface KLAPIImplUtils : NSObject

+ (void)initClient:(id<KLHTTPClient>)client
               url:(NSString *)url
            method:(NSString *)method
             appID:(NSString *)appID
            appKey:(NSString *)appKey
          andToken:(NSString *)token;
@end
