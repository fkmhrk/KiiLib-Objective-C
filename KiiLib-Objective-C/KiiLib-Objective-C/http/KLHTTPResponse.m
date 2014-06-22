//
//  KLHTTPResponse.m
//  KiiLib-Objective-C
//
//  Created by fkm on 2014/06/22.
//  Copyright (c) 2014年 fkmsoft.jp. All rights reserved.
//

#import "KLHTTPResponse.h"

@implementation KLHTTPResponse

- (NSDictionary *)getBodyAsJSON
{
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingAllowFragments error:&error];
    if (error != nil) {
        return nil;
    }
    return json;
}
@end
