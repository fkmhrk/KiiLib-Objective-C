//
//  KLBucket.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import "KLBucket.h"

@implementation KLBucket

- (KLBucket *)initWithOwner:(id<KLBucketOwnable>)owner andName:(NSString *)name;
{
    self = [super init];
    if (self != nil) {
        self.owner = owner;
        self.name = name;
    }
    return self;
}

- (NSString *)getResourcePath
{
    if (self.owner == nil) {
        return [NSString stringWithFormat:@"/buckets/%@", self.name ];
    } else {
        return [NSString stringWithFormat:@"%@/buckets/%@", [self.owner getResourcePath], self.name ];
    }
}
@end
