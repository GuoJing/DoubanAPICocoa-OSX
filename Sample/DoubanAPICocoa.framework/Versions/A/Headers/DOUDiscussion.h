//
//  DOUDiscussion.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-20.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUObject.h"
#import "DOUUser.h"

@interface DOUDiscussion : DOUObject

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *commentsCount;
@property (nonatomic, copy) NSString *alt;
@property (nonatomic, retain) NSDate *updated;
@property (nonatomic, retain) DOUUser *author;

@end
