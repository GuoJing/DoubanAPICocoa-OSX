//
//  DOUEventEngine.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-13.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUEngine.h"
#import "DOUEvent.h"

@interface DOUEventEngine : DOUEngine

- (void)getEventWithRemoteID:(NSString *)event_id successBlock:(void(^)(DOUEvent *))successBlock;

@end
