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
@synthesize reshared_status;
@synthesize reshared_count;
@synthesize attachments;
@synthesize entities;
@synthesize text;
@synthesize created_at;
@synthesize title;
@synthesize can_reply;
@synthesize liked;
@synthesize source;
@synthesize like_count;
@synthesize comments_count;
@synthesize user;
@synthesize is_follow;
@synthesize has_photo;
@synthesize type;
@synthesize identifier;

@synthesize attachments_description;
@synthesize attachments_title;
@synthesize attachments_media;
@synthesize attachments_caption;
@synthesize attachments_href;
@synthesize attachments_type;
@synthesize attachments_properties;

@synthesize attachments_media_src;
@synthesize attachments_media_secret_pid;
@synthesize attachments_media_original_src;
@synthesize attachments_media_href;
@synthesize attachments_media_type;

@synthesize user_id;
@synthesize user_description;
@synthesize user_small_avatar;
@synthesize user_large_avatar;
@synthesize user_type;
@synthesize user_name;

@synthesize reshared_id;
@synthesize reshared_category;
@synthesize reshared_reshared_count;
@synthesize reshared_text;
@synthesize reshared_created_at;
@synthesize reshared_title;
@synthesize reshared_can_reply;
@synthesize reshared_liked;
@synthesize reshared_reshare_id;
@synthesize reshared_like_count;
@synthesize reshared_comments_count;

- (NSString *)category {
    return [self.dictionary objectForKey:@"category"];
}

- (NSString *)reshared_status {
    return [self.dictionary objectForKey:@"reshared_status"];
}

- (NSString *)reshared_count {
    return [self.dictionary objectForKey:@"reshared_count"];
}

- (NSString *)attachments {
    return [self.dictionary objectForKey:@"attachments"];
}

- (NSString *)text {
    return [self.dictionary objectForKey:@"text"];
}

- (NSString *)entities {
    return [self.dictionary objectForKey:@"entities"];
}

- (NSString *)created_at {
    return [self.dictionary objectForKey:@"created_at"];
}

- (NSString *)title {
    return [self.dictionary objectForKey:@"title"];
}

- (NSString *)can_reply {
    return [self.dictionary objectForKey:@"can_reply"];
}

- (NSString *)liked {
    return [self.dictionary objectForKey:@"liked"];
}

- (NSString *)source {
    return [self.dictionary objectForKey:@"source"];
}

- (NSString *)like_count {
    return [self.dictionary objectForKey:@"like_count"];
}

- (NSString *)comments_count {
    return [self.dictionary objectForKey:@"comments_count"];
}

- (NSString *)user {
    return [self.dictionary objectForKey:@"user"];
}

- (NSString *)status {
    return [self.dictionary objectForKey:@"status"];
}

- (NSString *)is_follow {
    return [self.dictionary objectForKey:@"is_follow"];
}

- (NSString *)has_photo {
    return [self.dictionary objectForKey:@"has_photo"];
}

- (NSString *)type {
    return [self.dictionary objectForKey:@"type"];
}

- (NSString *)identifier {
    return [self.dictionary objectForKey:@"id"];
}

- (NSString *)attachments_description {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"attachments"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"description"];
    }
}

- (NSString *)attachments_title {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"attachments"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"title"];
    }
}

- (NSString *)attachments_media {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"attachments"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"media"];
    }
}

- (NSString *)attachments_media_src {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"attachments"];
    if (!dic) {
        return nil;
    } else {
        NSMutableDictionary *dic2 = [dic objectForKey:@"media"];
        if (!dic2) {
            return nil;
        } else {
            return [dic2 objectForKey:@"src"];
        }
    }
}

- (NSString *)attachments_media_secret_pid {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"attachments"];
    if (!dic) {
        return nil;
    } else {
        NSMutableDictionary *dic2 = [dic objectForKey:@"media"];
        if (!dic2) {
            return nil;
        } else {
            return [dic2 objectForKey:@"secret_pid"];
        }
    }
}

- (NSString *)attachments_media_original_src {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"attachments"];
    if (!dic) {
        return nil;
    } else {
        NSMutableDictionary *dic2 = [dic objectForKey:@"media"];
        if (!dic2) {
            return nil;
        } else {
            return [dic2 objectForKey:@"original_src"];
        }
    }
}

- (NSString *)attachments_media_href {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"attachments"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"media"];
    }
}

- (NSString *)attachments_media_type {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"attachments"];
    if (!dic) {
        return nil;
    } else {
        NSMutableDictionary *dic2 = [dic objectForKey:@"media"];
        if (!dic2) {
            return nil;
        } else {
            return [dic2 objectForKey:@"media_type"];
        }
    }
}

- (NSString *)attachments_caption {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"attachments"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"caption"];
    }
}

- (NSString *)attachments_href {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"attachments"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"href"];
    }
}

- (NSString *)attachments_type {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"attachments"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"type"];
    }
}

- (NSString *)attachments_properties {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"attachments"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"properties"];
    }
}

- (NSString *)user_id {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"user"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"uid"];
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

- (NSString *)user_type {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"user"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"type"];
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

- (NSString *)reshared_id {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"reshared_status"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"id"];
    }
}

- (NSString *)reshared_category {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"reshared_status"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"category"];
    }
}

- (NSString *)reshared_reshared_count {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"reshared_status"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"reshared_count"];
    }
}

- (NSString *)reshared_text {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"reshared_status"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"text"];
    }
}

- (NSString *)reshared_created_at {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"reshared_status"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"created_at"];
    }
}

- (NSString *)reshared_title {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"reshared_status"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"title"];
    }
}

- (NSString *)reshared_can_reply {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"reshared_status"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"can_reply"];
    }
}

- (NSString *)reshared_liked {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"reshared_status"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"licked"];
    }
}

- (NSString *)reshared_reshare_id {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"reshared_status"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"reshare_id"];
    }
}

- (NSString *)reshared_like_count {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"reshared_status"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"like_count"];
    }
}

- (NSString *)reshared_comments_count {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"reshared_status"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"comments_count"];
    }
}

@end
