//
//  DOUUserArray.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-16.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUUserArray.h"
#import "DOUUser.h"

@implementation DOUUserArray

+ (Class)objectClass {
    return [DOUUser class];
}

+ (NSString *)objectName {
    return @"onlines";
}

@end
