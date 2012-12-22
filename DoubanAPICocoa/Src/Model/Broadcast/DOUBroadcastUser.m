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
@synthesize followingCount;
@synthesize blocked;
@synthesize city;
@synthesize verified;
@synthesize isFirstVsit;
@synthesize followersCount;
@synthesize location;
@synthesize loggedIn;
@synthesize type;
@synthesize largeAvatar;
@synthesize iconAvatar;
@synthesize smallAvatar;
@synthesize statusCount;
@synthesize description;
@synthesize blocking;
@synthesize screenName;
@synthesize url;
@synthesize createdAt;
@synthesize following;


- (NSString *)identifier {
    return [self.dictionary objectForKey:@"id"];
}

- (NSString *)uid {
    return [self.dictionary objectForKey:@"uid"];
}

- (NSString *)followingCount {
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

- (NSString *)isFirstVsit {
    return [self.dictionary objectForKey:@"is_first_visit"];
}

- (NSString *)followersCount {
    return [self.dictionary objectForKey:@"followers_count"];
}

- (NSString *)location {
    return [self.dictionary objectForKey:@"location"];
}

- (NSString *)loggedIn {
    return [self.dictionary objectForKey:@"logged_in"];
}

- (NSString *)type {
    return [self.dictionary objectForKey:@"type"];
}

- (NSString *)largeAvatar {
    return [self.dictionary objectForKey:@"large_avatar"];
}

- (NSString *)iconAvatar {
    return [self.dictionary objectForKey:@"icon_avatar"];
}

- (NSString *)smallAvatar {
    return [self.dictionary objectForKey:@"small_avatar"];
}

- (NSString *)statusCount {
    return [self.dictionary objectForKey:@"status_count"];
}

- (NSString *)description {
    return [self.dictionary objectForKey:@"description"];
}

- (NSString *)blocking {
    return [self.dictionary objectForKey:@"blocking"];
}

- (NSString *)screenName {
    return [self.dictionary objectForKey:@"screen_name"];
}

- (NSString *)url {
    return [self.dictionary objectForKey:@"url"];
}

- (NSString *)createdAt {
    return [self.dictionary objectForKey:@"created_at"];
}

- (NSString *)following {
    return [self.dictionary objectForKey:@"following"];
}

@end
