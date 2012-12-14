//
//  DOULocEngine.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-14.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUEngine.h"
#import "DOULoc.h"

@interface DOULocEngine : DOUEngine

- (void)getLocWithRemoteID:(NSString *)event_id
              successBlock:(void(^)(DOULoc *))successBlock
               failedBlock:(void(^)(NSString *))failedBlock;

@end
