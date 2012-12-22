//
//  DOUBroadcastAttechmentArray.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-22.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUBroadcastAttechmentArray.h"
#import "DOUBroadcastAttachment.h"

@implementation DOUBroadcastAttechmentArray

+ (Class)objectClass {
    return [DOUBroadcastAttachment class];
}

+ (NSString *)objectName {
    return @"attachments";
}

@end
