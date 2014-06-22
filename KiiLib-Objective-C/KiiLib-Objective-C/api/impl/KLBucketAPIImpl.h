//
//  KLBucketAPIImpl.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLBucketAPI.h"
#import "KLAppAPIImpl.h"

@interface KLBucketAPIImpl : NSObject <KLBucketAPI>

@property (weak) KLAppAPIImpl *app;

@end
