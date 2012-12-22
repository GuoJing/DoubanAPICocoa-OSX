//
//  DOUBroadcastReshareStatus.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-22.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUObject.h"
#import "DOUBroadcastAttachment.h"
#import "DOUBroadcastUser.h"

@interface DOUBroadcastReshareStatus : DOUObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *count;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *canReply;
@property (nonatomic, copy) NSString *liked;
@property (nonatomic, copy) NSString *reshareId;
@property (nonatomic, copy) NSString *likeCount;
@property (nonatomic, copy) NSString *commentsCount;
@property (nonatomic, copy) DOUBroadcastAttachment *attachments;
@property (nonatomic, copy) DOUBroadcastUser *user;

@end
