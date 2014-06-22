//
//  KLUserAPI.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLUser.h"

@protocol KLUserAPI <NSObject>

- (void) signUp:(NSDictionary *)info withPassword:(NSString *)password andBlock:(void (^)(KLUser *user, NSError *error))block;

@end
