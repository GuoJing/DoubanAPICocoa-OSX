//
//  DOUBroadcastComment.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUBroadcastComment.h"

@implementation DOUBroadcastComment

@synthesize unread_notification_id;
@synthesize text;
@synthesize source;
@synthesize created_at;
@synthesize entities;
@synthesize user;
@synthesize title;
@synthesize identifier;

@synthesize user_id;
@synthesize user_city;
@synthesize user_status_count;
@synthesize user_url;
@synthesize user_created_at;
@synthesize user_description;
@synthesize user_location;
@synthesize user_uid;
@synthesize user_icon_avatar;
@synthesize user_small_avatar;
@synthesize user_large_avatar;
@synthesize user_type;
@synthesize user_name;

- (NSString *)unread_notification_id {
    return [self.dictionary objectForKey:@"unread_notification_id"];
}

- (NSString *)text {
    return [self.dictionary objectForKey:@"text"];
}

- (NSString *)source {
    return [self.dictionary objectForKey:@"source"];
}

- (NSString *)created_at {
    return [self.dictionary objectForKey:@"created_at"];
}

- (NSString *)entities {
    return [self.dictionary objectForKey:@"entities"];
}

- (NSString *)user {
    return [self.dictionary objectForKey:@"user"];
}

- (NSString *)title {
    return [self.dictionary objectForKey:@"title"];
}

- (NSString *)identifier {
    return [self.dictionary objectForKey:@"id"];
}

- (NSString *)user_id {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"user"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"id"];
    }
}

- (NSString *)user_type {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"user"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"type"];
    }
}

- (NSString *)user_city {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"user"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"city"];
    }
}

- (NSString *)user_status_count {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"user"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"status_count"];
    }
}

- (NSString *)user_url {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"user"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"url"];
    }
}

- (NSString *)user_created_at {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"user"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"created_at"];
    }
}

- (NSString *)user_description {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"user"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"description"];
    }
}

- (NSString *)user_location {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"user"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"location"];
    }
}

- (NSString *)user_uid {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"user"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"uid"];
    }
}

- (NSString *)user_icon_avatar {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"user"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"icon_avatar"];
    }
}

- (NSString *)user_small_avatar {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"user"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"small_avatar"];
    }
}

- (NSString *)user_large_avatar {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"user"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"large_avatar"];
    }
}

- (NSString *)user_name {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"user"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"screen_name"];
    }
}
@end
