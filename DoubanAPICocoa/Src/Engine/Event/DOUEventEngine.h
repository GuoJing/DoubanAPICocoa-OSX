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
#import "DOUEventArray.h"
#import "DOUUser.h"

@interface DOUEventEngine : DOUEngine

- (void)getEventWithRemoteID:(NSString *)event_id
                successBlock:(void(^)(DOUEvent *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock;

- (void)getParticipantedUsersWithRemoteEventID:(NSString *)event_id
                            successBlock:(void(^)(DOUUser *))successBlock
                             failedBlock:(void(^)(NSString *))failedBlock;

- (void)getWishedUsersWithRemoteEventID:(NSString *)event_id
                           successBlock:(void(^)(DOUUser *))successBlock
                            failedBlock:(void(^)(NSString *))failedBlock;

- (void)getUserEventsWithRemoteUserID:(NSString *)user_id
                   successBlock:(void(^)(DOUEventArray *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock;

- (void)getUserParticipantedEventsWithRemoteUserID:(NSString *)user_id
                                      successBlock:(void(^)(DOUEventArray *))successBlock
                                       failedBlock:(void(^)(NSString *))failedBlock;

- (void)getUserWishedEventsWithRemoteUserID:(NSString *)event_id
                               successBlock:(void(^)(DOUEventArray *))successBlock
                                failedBlock:(void(^)(NSString *))failedBlock;

@end
