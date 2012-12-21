//
//  DOUMail.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUObject.h"
#import "DOUUser.h"

@interface DOUMail : DOUObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *published;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) DOUUser *sender;
@property (nonatomic, copy) DOUUser *receiver;

@property (nonatomic, copy) NSString *senderId;
@property (nonatomic, copy) NSString *senderAlt;
@property (nonatomic, copy) NSString *senderName;
@property (nonatomic, copy) NSString *senderUid;
@property (nonatomic, copy) NSString *senderAvatar;

@property (nonatomic, copy) NSString *receiverId;
@property (nonatomic, copy) NSString *receiverAlt;
@property (nonatomic, copy) NSString *receiverName;
@property (nonatomic, copy) NSString *receiverUid;
@property (nonatomic, copy) NSString *receiverAvatar;

@end
