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
#import "DOUUserArray.h"
#import "DOUDiscussionArray.h"

@interface DOUEventEngine : DOUEngine

- (void)getEventWithRemoteID:(NSString *)event_id
                successBlock:(void(^)(DOUEvent *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock;

- (void)getParticipantedUsersWithRemoteEventID:(NSString *)event_id
                                     userStart:(int)start
                                     userCount:(int)count
                            successBlock:(void(^)(DOUUserArray *))successBlock
                             failedBlock:(void(^)(NSString *))failedBlock;

- (void)getWishedUsersWithRemoteEventID:(NSString *)event_id
                              userStart:(int)start
                              userCount:(int)count
                           successBlock:(void(^)(DOUUserArray *))successBlock
                            failedBlock:(void(^)(NSString *))failedBlock;

- (void)getUserEventsWithRemoteUserID:(NSString *)user_id
                            userStart:(int)start
                            userCount:(int)count
                   successBlock:(void(^)(DOUEventArray *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock;

- (void)getUserParticipantedEventsWithRemoteUserID:(NSString *)user_id
                                         userStart:(int)start
                                         userCount:(int)count
                                      successBlock:(void(^)(DOUEventArray *))successBlock
                                       failedBlock:(void(^)(NSString *))failedBlock;

- (void)getUserWishedEventsWithRemoteUserID:(NSString *)event_id
                                  userStart:(int)start
                                  userCount:(int)count
                               successBlock:(void(^)(DOUEventArray *))successBlock
                                failedBlock:(void(^)(NSString *))failedBlock;

- (void)attendEventWithID:(NSString *)event_id
       successBlock:(void(^)(NSString *))successBlock
        failedBlock:(void(^)(NSString *))failedBlock;

- (void)quitAttendEventWithID:(NSString *)event_id
     successBlock:(void(^)(NSString *))successBlock
      failedBlock:(void(^)(NSString *))failedBlock;

- (void)wishEventWithID:(NSString *)event_id
     successBlock:(void(^)(NSString *))successBlock
      failedBlock:(void(^)(NSString *))failedBlock;

- (void)quitWishEventWithID:(NSString *)event_id
       successBlock:(void(^)(NSString *))successBlock
        failedBlock:(void(^)(NSString *))failedBlock;

- (void)getDiscussionListWithID:(NSString *)event_id
                   successBlock:(void(^)(DOUDiscussionArray *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock;

- (void)uploadPhotoWithOnlineID:(NSString *)event_id
                  withImageData:(NSData *)image_data
                       withDesc:(NSString *)desc
                   successBlock:(void(^)(NSString *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock;
@end
