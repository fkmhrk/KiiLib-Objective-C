//
//  KLQueryParam.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLClause.h"

@interface KLQueryParam : NSObject

- (KLQueryParam *)initWithClause:(KLClause *)clause;

- (void) setSortByAsc:(NSString *)field;

- (void) setSortByDesc:(NSString *)field;

- (void) setLimit:(NSNumber*)limit;

- (void) setPaginationKey:(NSString *)key;

@property NSMutableDictionary *json;
@property NSMutableDictionary *bucketQuery;
@end
