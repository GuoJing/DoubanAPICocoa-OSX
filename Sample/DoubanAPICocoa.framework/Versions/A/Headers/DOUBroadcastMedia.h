//
//  DOUBroadcastMedia.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-22.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUObject.h"

@interface DOUBroadcastMedia : DOUObject

@property (nonatomic, copy) NSString *src;
@property (nonatomic, copy) NSString *secretPid;
@property (nonatomic, copy) NSString *originalSrc;
@property (nonatomic, copy) NSString *href;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *sizes;

@end
