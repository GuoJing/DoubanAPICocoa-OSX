//
//  DOUBroadcastComment.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DOUObject.h"
#import "DOUBroadcastUser.h"

@interface DOUBroadcastComment : DOUObject

@property (nonatomic, copy) NSString *unreadNotificationId;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *entities;
@property (nonatomic, copy) DOUBroadcastUser *user;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *identifier;

@end
