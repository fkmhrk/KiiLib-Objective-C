//
//  KLMockHTTPClient.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLHTTPClient.h"

@interface KLMockHTTPClient : NSObject <KLHTTPClient>

@property KLHTTPResponse *response;
@end
