//
//  DOUBroadcastUser.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUObject.h"

@interface DOUBroadcastUser : DOUObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *followingCount;
@property (nonatomic, copy) NSString *blocked;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *verified;
@property (nonatomic, copy) NSString *isFirstVsit;
@property (nonatomic, copy) NSString *followersCount;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *loggedIn;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *largeAvatar;
@property (nonatomic, copy) NSString *iconAvatar;
@property (nonatomic, copy) NSString *smallAvatar;
@property (nonatomic, copy) NSString *statusCount;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *blocking;
@property (nonatomic, copy) NSString *screenName;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *following;

@end
