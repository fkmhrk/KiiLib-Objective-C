//
//  KLBucket.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import "KLBucket.h"

@implementation KLBucket

- (KLBucket *)initWithName:(NSString *)name
{
    self = [super init];
    if (self != nil) {
        self.name = name;
    }
    return self;
}
@end
