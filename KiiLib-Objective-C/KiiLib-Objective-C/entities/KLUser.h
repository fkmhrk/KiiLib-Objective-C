//
//  KLUser.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLUser : NSMutableDictionary

- (KLUser *)initWithID:(NSString *)id;

- (KLUser *)initWithJSON:(NSDictionary *)json;

@property NSString *id;
@end
