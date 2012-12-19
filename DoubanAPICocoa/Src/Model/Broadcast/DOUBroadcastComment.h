//
//  DOUBroadcastComment.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DOUObject.h"

@interface DOUBroadcastComment : DOUObject

@property (nonatomic, copy) NSString *unread_notification_id;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *created_at;
@property (nonatomic, copy) NSString *entities;
@property (nonatomic, copy) NSString *user;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *user_city;
@property (nonatomic, copy) NSString *user_status_count;
@property (nonatomic, copy) NSString *user_url;
@property (nonatomic, copy) NSString *user_created_at;
@property (nonatomic, copy) NSString *user_description;
@property (nonatomic, copy) NSString *user_location;
@property (nonatomic, copy) NSString *user_uid;
@property (nonatomic, copy) NSString *user_icon_avatar;
@property (nonatomic, copy) NSString *user_small_avatar;
@property (nonatomic, copy) NSString *user_large_avatar;
@property (nonatomic, copy) NSString *user_type;
@property (nonatomic, copy) NSString *user_name;

@end
