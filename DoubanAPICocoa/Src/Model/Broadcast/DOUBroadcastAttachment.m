//
//  DOUBroadcastAttachment.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-22.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUBroadcastAttachment.h"

@implementation DOUBroadcastAttachment

@dynamic identifier;
@dynamic description;
@dynamic title;
@dynamic media;
@dynamic expandHref;
@dynamic caption;
@dynamic href;
@dynamic type;
@dynamic properties;

- (NSString *)identifier {
    return [self.dictionary objectForKey:@"id"];
}

- (NSString *)description {
    return [self.dictionary objectForKey:@"description"];
}

- (NSString *)title {
    return [self.dictionary objectForKey:@"title"];
}

- (DOUBroadcastMedia *)media {
    NSDictionary *dic = [self.dictionary objectForKey:@"media"];
    DOUBroadcastMedia *media = [DOUBroadcastMedia objectWithDictionary:dic];
    return media;
}

- (NSString *)expandHref {
    return [self.dictionary objectForKey:@"expand_href"];
}

- (NSString *)caption {
    return [self.dictionary objectForKey:@"caption"];
}

- (NSString *)href {
    return [self.dictionary objectForKey:@"href"];
}

- (NSString *)type {
    return [self.dictionary objectForKey:@"type"];
}

- (NSString *)properties {
    return [self.dictionary objectForKey:@"properties"];
}

@end
