//
//  KLBucket.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLBucketOwnable.h"

@interface KLBucket : NSObject

- (KLBucket *)initWithOwner:(id<KLBucketOwnable>)owner andName:(NSString *)name;

- (NSString *)getResourcePath;

@property id<KLBucketOwnable> owner;
@property NSString *name;
@end
