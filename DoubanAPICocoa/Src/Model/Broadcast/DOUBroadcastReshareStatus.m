//
//  DOUBroadcastReshareStatus.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-22.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUBroadcastReshareStatus.h"

@implementation DOUBroadcastReshareStatus

@dynamic identifier;
@dynamic category;
@dynamic count;
@dynamic text;
@dynamic createdAt;
@dynamic title;
@dynamic canReply;
@dynamic liked;
@dynamic reshareId;
@dynamic likeCount;
@dynamic commentsCount;
@dynamic user;
@dynamic attachments;

- (NSString *)identifier {
    return [self.dictionary objectForKey:@"id"];
}

- (NSString *)category {
    return [self.dictionary objectForKey:@"category"];
}

- (NSString *)count {
    return [self.dictionary objectForKey:@"reshared_count"];
}

- (NSString *)text {
    return [self.dictionary objectForKey:@"text"];
}

- (NSString *)canReply {
    return [self.dictionary objectForKey:@"can_reply"];
}

- (NSString *)liked {
    return [self.dictionary objectForKey:@"liked"];
}

- (NSString *)reshareId {
    return [self.dictionary objectForKey:@"reshare_id"];
}

- (NSString *)likeCount {
    return [self.dictionary objectForKey:@"like_count"];
}

- (NSString *)commentsCount {
    return [self.dictionary objectForKey:@"comments_count"];
}

- (NSString *)createdAt {
    return [self.dictionary objectForKey:@"created_at"];
}

- (NSString *)title {
    return [self.dictionary objectForKey:@"title"];
}

- (DOUBroadcastAttachment *)attachments {
    NSDictionary *dic = [self.dictionary objectForKey:@"attachments"];
    DOUBroadcastAttachment *atts = [DOUBroadcastAttachment objectWithDictionary:dic];
    return atts;
}

- (DOUBroadcastUser *)user {
    NSDictionary *dic = [self.dictionary objectForKey:@"user"];
    DOUBroadcastUser *usr = [DOUBroadcastUser objectWithDictionary:dic];
    return usr;
}

@end
