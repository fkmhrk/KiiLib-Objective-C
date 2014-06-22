//
//  KLUser.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import "KLUser.h"

@implementation KLUser
- (KLUser *)initWithID:(NSString *)id
{
    self = [super init];
    if (self != nil) {
        self.id = id;
    }
    return self;
}

- (KLUser *)initWithJSON:(NSDictionary *)json
{
    self = [super init];
    if (self != nil) {
        self.id = json[@"userID"];
    }
    return self;
}

@end
