//
//  KLObject.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import "KLObject.h"

@implementation KLObject

- (KLObject *)initWithBucket:(KLBucket *)bucket andID:(NSString *)id
{
    self = [super init];
    if (self != nil) {
        self.bucket = bucket;
        self.id = id;
    }
    return self;
}
@end
