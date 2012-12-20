//
//  DOUDiscussionEngine.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-20.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUEngine.h"
#import "DOUDiscussion.h"
#import "DOUDiscussionArray.h"
#import "DOUCommentArray.h"

@interface DOUDiscussionEngine : DOUEngine

- (void)getDiscussionWithRemoteID:(NSString *)discussion_id
                     successBlock:(void(^)(DOUDiscussion *))successBlock
                      failedBlock:(void(^)(NSString *))failedBlock;

- (void)editDiscussionWithRemoteID:(NSString *)discussion_id
                         withTitle:(NSString *)title
                       withContent:(NSString *)content
                      successBlock:(void(^)(NSString *))successBlock
                       failedBlock:(void(^)(NSString *))failedBlock;

- (void)deleteDiscussionWithRemoteID:(NSString *)discussion_id
                     successBlock:(void(^)(NSString *))successBlock
                      failedBlock:(void(^)(NSString *))failedBlock;

- (void)writeDiscussionWithTarget:(NSString *)target
                         withTargetID:(NSString *)target_id
                        withTitle:(NSString *)title
                      withContent:(NSString *)content
                     successBlock:(void(^)(NSString *))successBlock
                      failedBlock:(void(^)(NSString *))failedBlock;

- (void)getDiscussionListWithTarget:(NSString *)target
                           withTargetID:(NSString *)target_id
                     successBlock:(void(^)(DOUDiscussionArray *))successBlock
                      failedBlock:(void(^)(NSString *))failedBlock;

- (void)getCommentListWithID:(NSString *)discussion_id
                successBlock:(void(^)(DOUCommentArray *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock;

@end
