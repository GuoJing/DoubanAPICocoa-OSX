//
//  DOUAlbumArray.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-20.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUAlbumArray.h"
#import "DOUAlbum.h"

@implementation DOUAlbumArray

+ (Class)objectClass {
    return [DOUAlbum class];
}


+ (NSString *)objectName {
    return @"albums";
}

@end
