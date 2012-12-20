//
//  DOUNoteEngine.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-20.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUEngine.h"
#import "DOUNote.h"
#import "DOUNoteArray.h"
#import "DOUCommentArray.h"

@interface DOUNoteEngine : DOUEngine

- (void)writeNoteWithTitle:(NSString *)title
               withPrivacy:(NSString *)privacy
              withCanReply:(NSString *)can_reply
               withContent:(NSString *)content
              successBlock:(void(^)(NSString *))successBlock
               failedBlock:(void(^)(NSString *))failedBlock;

- (void)getNoteWithRemoteID:(NSString *)note_id
               successBlock:(void(^)(DOUNote *))successBlock
                failedBlock:(void(^)(NSString *))failedBlock;

- (void)editNoteWithRemoteID:(NSString *)note_id
                     withTitle:(NSString *)title
                   withPrivacy:(NSString *)privacy
                  withCanReply:(NSString *)can_reply
                   withContent:(NSString *)content
                  successBlock:(void(^)(NSString *))successBlock
                   failedBlock:(void(^)(NSString *))failedBlock;

- (void)deleteNoteWithRemoteID:(NSString *)note_id
                  successBlock:(void(^)(NSString *))successBlock
                   failedBlock:(void(^)(NSString *))failedBlock;

- (void)uploadPhotoWithNoteID:(NSString *)note_id
                  withContent:(NSString *)content
                      withPid:(NSString *)pid
                withLayoutPid:(NSString *)layout_pid
                  withDescPid:(NSString *)desc_pid
                 withImagePid:(NSString *)image_pid
                withImageData:(NSData *)image_data
                 successBlock:(void(^)(NSString *))successBlock
                  failedBlock:(void(^)(NSString *))failedBlock;

- (void)getNoteCommentsWithNoteID:(NSString *)note_id
                     successBlock:(void(^)(DOUCommentArray *))successBlock
                      failedBlock:(void(^)(NSString *))failedBlock;

- (void)likeNoteWithNoteID:(NSString *)note_id
              successBlock:(void(^)(NSString *))successBlock
               failedBlock:(void(^)(NSString *))failedBlock;

- (void)unLikeNoteWithNoteID:(NSString *)note_id
              successBlock:(void(^)(NSString *))successBlock
               failedBlock:(void(^)(NSString *))failedBlock;

- (void)getNotesWithUserID:(NSString *)user_id
              successBlock:(void(^)(DOUNoteArray *))successBlock
               failedBlock:(void(^)(NSString *))failedBlock;

- (void)getUserLikedNotesWithUserID:(NSString *)user_id
              successBlock:(void(^)(DOUNoteArray *))successBlock
               failedBlock:(void(^)(NSString *))failedBlock;

@end
