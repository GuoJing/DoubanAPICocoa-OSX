//
//  DOUMail.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUObject.h"

@interface DOUMail : DOUObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *published;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *sender;
@property (nonatomic, copy) NSString *receiver;

@property (nonatomic, copy) NSString *sender_id;
@property (nonatomic, copy) NSString *sender_alt;
@property (nonatomic, copy) NSString *sender_name;
@property (nonatomic, copy) NSString *sender_uid;
@property (nonatomic, copy) NSString *sender_avatar;

@property (nonatomic, copy) NSString *receiver_id;
@property (nonatomic, copy) NSString *receiver_alt;
@property (nonatomic, copy) NSString *receiver_name;
@property (nonatomic, copy) NSString *receiver_uid;
@property (nonatomic, copy) NSString *receiver_avatar;

@end
