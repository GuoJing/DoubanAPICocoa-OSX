//
//  DOUBroadcast.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUObject.h"
#import "DOUBroadcastAttachment.h"
#import "DOUBroadcastUser.h"
#import "DOUBroadcastReshareStatus.h"

@interface DOUBroadcast : DOUObject

@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) DOUBroadcastReshareStatus *resharedStatus;
@property (nonatomic, copy) NSString *resharedCount;
@property (nonatomic, copy) DOUBroadcastAttachment *attachments;
@property (nonatomic, copy) NSString *entities;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *canReply;
@property (nonatomic, copy) NSString *liked;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *likeCount;
@property (nonatomic, copy) NSString *commentsCount;
@property (nonatomic, copy) DOUBroadcastUser *user;
@property (nonatomic, copy) NSString *isFollow;
@property (nonatomic, copy) NSString *hasPhoto;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *identifier;

@end
