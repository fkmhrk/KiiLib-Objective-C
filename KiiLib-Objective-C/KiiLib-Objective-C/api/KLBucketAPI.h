//
//  KLBucketAPI.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLBucket.h"
#import "KLQueryParam.h"

@protocol KLBucketAPI <NSObject>

- (void) queryWithBucket:(KLBucket *)bucket
                   param:(KLQueryParam *)param
               andBlock:(void (^)(NSArray *result, NSString *paginationKey, NSError *error)) block;

@end
