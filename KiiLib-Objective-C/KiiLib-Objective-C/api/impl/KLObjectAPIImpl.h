//
//  KLObjectAPIImpl.h
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLObjectAPI.h"
#import "KLAppAPIImpl.h"

@interface KLObjectAPIImpl : NSObject <KLObjectAPI>

@property (weak) KLAppAPIImpl *app;

@end
