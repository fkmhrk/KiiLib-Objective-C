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
        self.json = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void) updateWithJSON:(NSDictionary *)json
{
    for (NSString *key in [json allKeys]) {
        self[key] = json[key];
    }
}

- (void) setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    [self.json setObject:anObject
              forKey:aKey];
}

- (void) removeObjectForKey:(id)aKey
{
    [self.json removeObjectForKey:aKey];
}

- (id) objectForKey:(id)aKey
{
    return [self.json objectForKey:aKey];
}
@end
