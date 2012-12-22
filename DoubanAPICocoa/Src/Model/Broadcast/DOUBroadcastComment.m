//
//  DOUBroadcastComment.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUBroadcastComment.h"

@implementation DOUBroadcastComment

@synthesize unreadNotificationId;
@synthesize text;
@synthesize source;
@synthesize createdAt;
@synthesize entities;
@synthesize user;
@synthesize title;
@synthesize identifier;

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

- (DOUBroadcastUser *)user {
    NSDictionary *dic = [self.dictionary objectForKey:@"user"];
    DOUBroadcastUser *usr = [DOUBroadcastUser objectWithDictionary:dic];
    return usr;
}

@end
