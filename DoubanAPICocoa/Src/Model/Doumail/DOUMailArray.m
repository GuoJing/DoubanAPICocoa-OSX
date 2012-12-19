//
//  DOUMailArray.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUMailArray.h"

#import "DOUMail.h"

@implementation DOUMailArray

+ (Class)objectClass {
    return [DOUMail class];
}

+ (NSString *)objectName {
    return @"mails";
}

@end
