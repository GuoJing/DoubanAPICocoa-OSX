//
//  DOUBroadcast.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUObject.h"

@interface DOUBroadcast : DOUObject

@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *reshared_count;
@property (nonatomic, copy) NSString *attachments;
@property (nonatomic, copy) NSString *entities;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *created_at;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *can_reply;
@property (nonatomic, copy) NSString *liked;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *like_count;
@property (nonatomic, copy) NSString *comments_count;
@property (nonatomic, copy) NSString *user;
@property (nonatomic, copy) NSString *is_follow;
@property (nonatomic, copy) NSString *has_photo;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, copy) NSString *attachments_description;
@property (nonatomic, copy) NSString *attachments_title;
@property (nonatomic, copy) NSString *attachments_media;
@property (nonatomic, copy) NSString *attachments_caption;
@property (nonatomic, copy) NSString *attachments_href;
@property (nonatomic, copy) NSString *attachments_type;
@property (nonatomic, copy) NSString *attachments_properties;

@property (nonatomic, copy) NSString *attachments_media_src;
@property (nonatomic, copy) NSString *attachments_media_secret_pid;
@property (nonatomic, copy) NSString *attachments_media_original_src;
@property (nonatomic, copy) NSString *attachments_media_href;
@property (nonatomic, copy) NSString *attachments_media_type;

@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *user_description;
@property (nonatomic, copy) NSString *user_small_avatar;
@property (nonatomic, copy) NSString *user_large_avatar;
@property (nonatomic, copy) NSString *user_type;
@property (nonatomic, copy) NSString *user_name;

@end
