//
//  DOUBroadcastLike.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUObject.h"

@interface DOUBroadcastLike : DOUObject

@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *following_count;
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *blocked;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *verified;
@property (nonatomic, copy) NSString *followers_count;
@property (nonatomic, copy) NSString *following;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *large_avatar;
@property (nonatomic, copy) NSString *icon_avatar;
@property (nonatomic, copy) NSString *small_avatar;
@property (nonatomic, copy) NSString *status_count;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *blocking;
@property (nonatomic, copy) NSString *screen_name;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *created_at;

@end
