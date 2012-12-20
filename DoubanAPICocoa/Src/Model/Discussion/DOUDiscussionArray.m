//
//  DOUDiscussionArray.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-20.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUDiscussionArray.h"
#import "DOUDiscussion.h"

@implementation DOUDiscussionArray

+ (Class)objectClass {
    return [DOUDiscussion class];
}

+ (NSString *)objectName {
    return @"discussions";
}

@end
