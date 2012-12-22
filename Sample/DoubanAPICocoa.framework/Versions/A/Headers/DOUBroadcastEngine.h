//
//  Broadcast.h
//  DoubanAPICocoa
//
//  Created by bettylwx's on 12-12-18.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUEngine.h"
#import "DOUBroadcast.h"
#import "DOUBroadcastArray.h"
#import "DOUBroadcastComment.h"
#import "DOUBroadcastCommentArray.h"
#import "DOUBroadcastUser.h"
#import "DOUBroadcastUserArray.h"

@interface DOUBroadcastEngine : DOUEngine

- (void)say:(NSString *)text
            withImage:(NSData *)image_data
         withRecTitle:(NSString *)title
           withRecUrl:(NSString *)url
          withRecDesc:(NSString *)desc
    successBlock:(void(^)(NSString *))successBlock
    failedBlock:(void(^)(NSString *))failedBlock;

- (void)say:(NSString *)text
    successBlock:(void(^)(NSString *))successBlock
    failedBlock:(void(^)(NSString *))failedBlock;

- (void)say:(NSString *)text
            withImage:(NSData *)image_data
            successBlock:(void(^)(NSString *))successBlock
             failedBlock:(void(^)(NSString *))failedBlock;

- (void)say:(NSString *)text
      withRecTitle:(NSString *)title
        withRecUrl:(NSString *)url
       withRecDesc:(NSString *)desc
      successBlock:(void(^)(NSString *))successBlock
       failedBlock:(void(^)(NSString *))failedBlock;

- (void)getHomeTimeLineSince:(int)since_id
                     untilID:(int)until_id
                       start:(int)start
                       count:(int)count
                successBlock:(void(^)(DOUBroadcastArray *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock;

- (void)getHomeTimeLineStartWith:(int)start
                           count:(int)count
                    successBlock:(void(^)(DOUBroadcastArray *))successBlock
                     failedBlock:(void(^)(NSString *))failedBlock;

- (void)getUserTimeLineSince:(int)since_id
                     untilID:(int)until_id
                      userID:(NSString *)user_id
                successBlock:(void(^)(DOUBroadcastArray *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock;

- (void)getUserTimeLineWithUserID:(NSString *)user_id
                     successBlock:(void(^)(DOUBroadcastArray *))successBlock
                      failedBlock:(void(^)(NSString *))failedBlock;

- (void)getBroadCastWithRemoteID:(NSString *)broadcast_id
                    successBlock:(void(^)(DOUBroadcast *))successBlock
                     failedBlock:(void(^)(NSString *))failedBlock;

- (void)deleteBroadCastWithRemoteID:(NSString *)broadcast_id
                    successBlock:(void(^)(NSString *))successBlock
                     failedBlock:(void(^)(NSString *))failedBlock;

- (void)getCommentsWithBroadCastID:(NSString *)broadcast_id
                             start:(int)start
                             count:(int)count
                      successBlock:(void(^)(DOUBroadcastCommentArray *))successBlock
                       failedBlock:(void(^)(NSString *))failedBlock;

- (void)writeCommentWithBroadCastID:(NSString *)broadcast_id
                       successBlock:(void(^)(DOUBroadcastComment *))successBlock
                        failedBlock:(void(^)(NSString *))failedBlock;

- (void)getCommentsWithRemoteID:(NSString *)comment_id
                             start:(int)start
                             count:(int)count
                      successBlock:(void(^)(DOUBroadcastComment *))successBlock
                       failedBlock:(void(^)(NSString *))failedBlock;

- (void)deleteCommentWithRemoteID:(NSString *)comment_id
                       successBlock:(void(^)(NSString *))successBlock
                        failedBlock:(void(^)(NSString *))failedBlock;

- (void)getResharersWithBroadCastID:(NSString *)broadcast_id
                     successBlock:(void(^)(DOUBroadcastUserArray *))successBlock
                      failedBlock:(void(^)(NSString *))failedBlock;

- (void)reshareWithBroadCastID:(NSString *)broadcast_id
                  successBlock:(void(^)(NSString *))successBlock
                   failedBlock:(void(^)(NSString *))failedBlock;

- (void)getLikersWithBroadCastID:(NSString *)broadcast_id
                     successBlock:(void(^)(DOUBroadcastUserArray *))successBlock
                      failedBlock:(void(^)(NSString *))failedBlock;

- (void)likeWithBroadCastID:(NSString *)broadcast_id
                  successBlock:(void(^)(NSString *))successBlock
                   failedBlock:(void(^)(NSString *))failedBlock;
@end
