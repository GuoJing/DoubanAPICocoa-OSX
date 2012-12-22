//
//  DOUBroadcast.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUBroadcast.h"

@implementation DOUBroadcast

@synthesize category;
@synthesize resharedStatus;
@synthesize resharedCount;
@synthesize attachments;
@synthesize entities;
@synthesize text;
@synthesize createdAt;
@synthesize title;
@synthesize canReply;
@synthesize liked;
@synthesize source;
@synthesize likeCount;
@synthesize commentsCount;
@synthesize user;
@synthesize isFollow;
@synthesize hasPhoto;
@synthesize type;
@synthesize identifier;

- (NSString *)category {
    return [self.dictionary objectForKey:@"category"];
}

- (DOUBroadcastReshareStatus *)resharedStatus {
    NSDictionary *dic = [self.dictionary objectForKey:@"reshared_status"];
    DOUBroadcastReshareStatus *shares = [DOUBroadcastReshareStatus objectWithDictionary:dic];
    return shares;
}

- (NSString *)resharedCount {
    return [self.dictionary objectForKey:@"reshared_count"];
}

- (DOUBroadcastAttachment *)attachments {
    NSDictionary *dic = [self.dictionary objectForKey:@"attachments"];
    DOUBroadcastAttachment *atts = [DOUBroadcastAttachment objectWithDictionary:dic];
    return atts;
}

- (NSString *)text {
    return [self.dictionary objectForKey:@"text"];
}

- (NSString *)entities {
    return [self.dictionary objectForKey:@"entities"];
}

- (NSString *)createdAt {
    return [self.dictionary objectForKey:@"created_at"];
}

- (NSString *)title {
    return [self.dictionary objectForKey:@"title"];
}

- (NSString *)canReply {
    return [self.dictionary objectForKey:@"can_reply"];
}

- (NSString *)liked {
    return [self.dictionary objectForKey:@"liked"];
}

- (NSString *)source {
    return [self.dictionary objectForKey:@"source"];
}

- (NSString *)likeCount {
    return [self.dictionary objectForKey:@"like_count"];
}

- (NSString *)commentsCount {
    return [self.dictionary objectForKey:@"comments_count"];
}

- (DOUBroadcastUser *)user {
    NSDictionary *dic = [self.dictionary objectForKey:@"user"];
    DOUBroadcastUser *usr = [DOUBroadcastUser objectWithDictionary:dic];
    return usr;
}

- (NSString *)status {
    return [self.dictionary objectForKey:@"status"];
}

- (NSString *)isFollow {
    return [self.dictionary objectForKey:@"is_follow"];
}

- (NSString *)hasPhoto {
    return [self.dictionary objectForKey:@"has_photo"];
}

- (NSString *)type {
    return [self.dictionary objectForKey:@"type"];
}

- (NSString *)identifier {
    return [self.dictionary objectForKey:@"id"];
}
@end
