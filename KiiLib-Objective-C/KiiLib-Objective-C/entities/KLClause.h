//
//  KLClause.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLClause : NSObject

- (KLClause *)initWithType:(NSString *)type;

+ (KLClause *)all;

+ (KLClause *)equalWithField:(NSString *)key andValue:(id)value;

@property NSMutableDictionary *json;

@end
