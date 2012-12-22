//
//  DOUBroadcastMediaArray.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-22.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUBroadcastMediaArray.h"

#import "DOUBroadcastMedia.h"

@implementation DOUBroadcastMediaArray

+ (Class)objectClass {
    return [DOUBroadcastMedia class];
}

+ (NSString *)objectName {
    return @"media";
}

@end
