//
//  DOUBroadcastAttachment.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-22.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUObject.h"
#import "DOUBroadcastMedia.h"

@interface DOUBroadcastAttachment : DOUObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) DOUBroadcastMedia *media;
@property (nonatomic, copy) NSString *expandHref;
@property (nonatomic, copy) NSString *caption;
@property (nonatomic, copy) NSString *href;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *properties;

@end
