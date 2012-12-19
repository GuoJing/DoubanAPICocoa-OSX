//
//  DOUBroadcastUser.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUBroadcastUser.h"

@implementation DOUBroadcastUser

@synthesize identifier;
@synthesize uid;
@synthesize following_count;
@synthesize blocked;
@synthesize city;
@synthesize verified;
@synthesize is_first_visit;
@synthesize followers_count;
@synthesize location;
@synthesize logged_in;
@synthesize type;
@synthesize large_avatar;
@synthesize icon_avatar;
@synthesize small_avatar;
@synthesize status_count;
@synthesize description;
@synthesize blocking;
@synthesize screen_name;
@synthesize url;
@synthesize created_at;
@synthesize following;


- (NSString *)identifier {
    return [self.dictionary objectForKey:@"id"];
}

- (NSString *)uid {
    return [self.dictionary objectForKey:@"uid"];
}

- (NSString *)following_count {
    return [self.dictionary objectForKey:@"following_count"];
}

- (NSString *)blocked {
    return [self.dictionary objectForKey:@"blocked"];
}

- (NSString *)city {
    return [self.dictionary objectForKey:@"blocked"];
}

- (NSString *)verified {
    return [self.dictionary objectForKey:@"verified"];
}

- (NSString *)is_first_visit {
    return [self.dictionary objectForKey:@"is_first_visit"];
}

- (NSString *)followers_count {
    return [self.dictionary objectForKey:@"followers_count"];
}

- (NSString *)location {
    return [self.dictionary objectForKey:@"location"];
}

- (NSString *)logged_in {
    return [self.dictionary objectForKey:@"logged_in"];
}

- (NSString *)type {
    return [self.dictionary objectForKey:@"type"];
}

- (NSString *)large_avatar {
    return [self.dictionary objectForKey:@"large_avatar"];
}

- (NSString *)icon_avatar {
    return [self.dictionary objectForKey:@"icon_avatar"];
}

- (NSString *)small_avatar {
    return [self.dictionary objectForKey:@"small_avatar"];
}

- (NSString *)status_count {
    return [self.dictionary objectForKey:@"status_count"];
}

- (NSString *)description {
    return [self.dictionary objectForKey:@"description"];
}

- (NSString *)blocking {
    return [self.dictionary objectForKey:@"blocking"];
}

- (NSString *)screen_name {
    return [self.dictionary objectForKey:@"screen_name"];
}

- (NSString *)url {
    return [self.dictionary objectForKey:@"url"];
}

- (NSString *)created_at {
    return [self.dictionary objectForKey:@"created_at"];
}

- (NSString *)following {
    return [self.dictionary objectForKey:@"following"];
}

@end
