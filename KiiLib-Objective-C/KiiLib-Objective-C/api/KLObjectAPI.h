//
//  KLObjectAPI.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLObject.h"
#import "KLBucket.h"

@protocol KLObjectAPI <NSObject>

- (void) create:(NSDictionary *)data bucket:(KLBucket *)bucket withBlock:(void (^)(KLObject *obj, NSError *error))block;
@end
