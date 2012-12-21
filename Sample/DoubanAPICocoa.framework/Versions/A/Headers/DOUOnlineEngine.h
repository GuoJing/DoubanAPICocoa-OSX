//
//  DOUOnlineEngine.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-14.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUEngine.h"
#import "DOUOnline.h"
#import "DOUOnlineArray.h"
#import "DOUUserArray.h"
#import "DOUPhotoArray.h"
#import "DOUDiscussionArray.h"

@interface DOUOnlineEngine : DOUEngine

- (void)getOnlineWithRemoteID:(NSString *)online_id
                 successBlock:(void(^)(DOUOnline *))successBlock
                  failedBlock:(void(^)(NSString *))failedBlock;

- (void)getParticipantedUsersWithRemoteOnlineID:(NSString *)event_id
                                     userStart:(int)start
                                     userCount:(int)count
                                  successBlock:(void(^)(DOUUserArray *))successBlock
                                   failedBlock:(void(^)(NSString *))failedBlock;

- (void)getDiscussionListWithID:(NSString *)event_id
                   successBlock:(void(^)(DOUDiscussionArray *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock;

- (void)getOnlineListWithID:(NSString *)event_id
                   successBlock:(void(^)(DOUOnlineArray *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock;

- (void)createOnlineWithTitle:(NSString *)title
                     withDesc:(NSString *)desc
                withBeginTime:(NSString *)begin_time
                  withEndTime:(NSString *)end_time
               withRelatedUrl:(NSString *)url
            withCascadeInvite:(NSString *)cascade_invite
                     withTags:(NSString *)tags
                 successBlock:(void(^)(NSString *))successBlock
                  failedBlock:(void(^)(NSString *))failedBlock;

- (void)editOnlineWithID:(NSString *)online_id
               WithTitle:(NSString *)title
                withDesc:(NSString *)desc
           withBeginTime:(NSString *)begin_time
             withEndTime:(NSString *)end_time
          withRelatedUrl:(NSString *)url
       withCascadeInvite:(NSString *)cascade_invite
                withTags:(NSString *)tags
            successBlock:(void(^)(NSString *))successBlock
             failedBlock:(void(^)(NSString *))failedBlock;

- (void)deleteOnlineWithID:(NSString *)online_id
               successBlock:(void(^)(NSString *))successBlock
                failedBlock:(void(^)(NSString *))failedBlock;

- (void)likeOnlineWithID:(NSString *)online_id
              successBlock:(void(^)(NSString *))successBlock
               failedBlock:(void(^)(NSString *))failedBlock;

- (void)unLikeOnlineWithID:(NSString *)online_id
              successBlock:(void(^)(NSString *))successBlock
               failedBlock:(void(^)(NSString *))failedBlock;

- (void)getPhotosWithOnlineID:(NSString *)online_id
              successBlock:(void(^)(DOUPhotoArray *))successBlock
               failedBlock:(void(^)(NSString *))failedBlock;

- (void)uploadPhotoWithOnlineID:(NSString *)online_id
                  withImageData:(NSData *)image_data
                       withDesc:(NSString *)desc
                   successBlock:(void(^)(NSString *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock;

- (void)getUserOnlineListWithUserID:(NSString *)user_id
                       successBlock:(void(^)(DOUOnlineArray *))successBlock
                        failedBlock:(void(^)(NSString *))failedBlock;

- (void)getUserCreatedOnlineListWithUserID:(NSString *)user_id
                       successBlock:(void(^)(DOUOnlineArray *))successBlock
                        failedBlock:(void(^)(NSString *))failedBlock;

- (void)attendOnlineWithID:(NSString *)online_id
              successBlock:(void(^)(NSString *))successBlock
               failedBlock:(void(^)(NSString *))failedBlock;

- (void)quitOnlineWithID:(NSString *)online_id
              successBlock:(void(^)(NSString *))successBlock
               failedBlock:(void(^)(NSString *))failedBlock;

@end
