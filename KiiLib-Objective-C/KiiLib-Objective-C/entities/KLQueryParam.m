//
//  KLQueryParam.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import "KLQueryParam.h"

@implementation KLQueryParam

- (KLQueryParam *)initWithClause:(KLClause *)clause
{
    self = [super init];
    if (self != nil) {
        self.json = [[NSMutableDictionary alloc] init];
        self.bucketQuery = [[NSMutableDictionary alloc] init];
        self.bucketQuery[@"clause"] = clause.json;
        self.json[@"bucketQuery"] = self.bucketQuery;
    }
    return self;
}

- (void) setSortByAsc:(NSString *)field
{
    self.bucketQuery[@"orderBy"] = field;
    self.bucketQuery[@"descending"] = @NO;
}

- (void) setSortByDesc:(NSString *)field
{
    self.bucketQuery[@"orderBy"] = field;
    self.bucketQuery[@"descending"] = @YES;
}

- (void) setLimit:(NSNumber*)limit
{
    self.json[@"bestEffortLimit"] = limit;
}

- (void) setPaginationKey:(NSString *)key
{
    self.json[@"paginationKey"] = key;
}
@end
