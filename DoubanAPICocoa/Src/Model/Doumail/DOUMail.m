//
//  DOUMail.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUMail.h"

@implementation DOUMail

@synthesize identifier;
@synthesize status;
@synthesize title;
@synthesize published;
@synthesize content;
@synthesize sender;
@synthesize receiver;

@synthesize sender_id;
@synthesize sender_alt;
@synthesize sender_name;
@synthesize sender_uid;
@synthesize sender_avatar;

@synthesize receiver_id;
@synthesize receiver_alt;
@synthesize receiver_name;
@synthesize receiver_uid;
@synthesize receiver_avatar;

- (NSString *)identifier {
    return [self.dictionary objectForKey:@"id"];
}

- (NSString *)status {
    return [self.dictionary objectForKey:@"status"];
}

- (NSString *)title {
    return [self.dictionary objectForKey:@"title"];
}

- (NSString *)published {
    return [self.dictionary objectForKey:@"published"];
}

- (NSString *)content {
    return [self.dictionary objectForKey:@"content"];
}

- (NSString *)sender {
    return [self.dictionary objectForKey:@"sender"];
}

- (NSString *)receiver {
    return [self.dictionary objectForKey:@"receiver"];
}

- (NSString *)sender_id {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"sender"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"id"];
    }
}

- (NSString *)sender_alt {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"sender"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"alt"];
    }
}

- (NSString *)sender_name {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"sender"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"name"];
    }
}

- (NSString *)sender_uid {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"sender"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"uid"];
    }
}

- (NSString *)sender_avatar {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"sender"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"avatar"];
    }
}

- (NSString *)receiver_id {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"receiver"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"id"];
    }
}

- (NSString *)receiver_alt {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"receiver"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"alt"];
    }
}

- (NSString *)receiver_name {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"receiver"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"name"];
    }
}

- (NSString *)receiver_uid {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"receiver"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"uid"];
    }
}

- (NSString *)receiver_avatar {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"receiver"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"avatar"];
    }
}

@end
