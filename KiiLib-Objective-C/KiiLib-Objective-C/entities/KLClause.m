//
//  KLClause.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import "KLClause.h"

@implementation KLClause

- (KLClause *)initWithType:(NSString *)type
{
    self = [super init];
    if (self != nil) {
        self.json = [[NSMutableDictionary alloc] init];
        self.json[@"type"] = type;
    }
    return self;
}

+ (KLClause *)all
{
    return [[KLClause alloc] initWithType:@"all"];
}

+ (KLClause *)equalWithField:(NSString *)key andValue:(id)value
{
    KLClause *clause = [[KLClause alloc] initWithType:@"eq"];
    clause.json[@"field"] = key;
    clause.json[@"value"] = value;
    return clause;
}


@end
