//
//  KLObject.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLBucket.h"

@interface KLObject : NSMutableDictionary

- (KLObject *)initWithBucket:(KLBucket *)bucket andID:(NSString *)id;

@property KLBucket *bucket;
@property NSString *id;
@end
