//
//  DOUCommentEngine.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-14.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUEngine.h"
#import "DOUComment.h"
#import "DOUCommentArray.h"

@interface DOUCommentEngine : DOUEngine

- (void)getCommentWithTarget:(NSString *)target
                withTargetID:(NSString *)target_id
               withCommentID:(NSString *)comment_id
                  successBlock:(void(^)(DOUComment *))successBlock
                   failedBlock:(void(^)(NSString *))failedBlock;

- (void)getCommentListWithTarget:(NSString *)target
                    withTargetID:(NSString *)target_id
                    successBlock:(void(^)(DOUCommentArray *))successBlock
                     failedBlock:(void(^)(NSString *))failedBlock;

- (void)writeCommentWithTarget:(NSString *)target
                   withTargetID:(NSString *)target_id
                   withContent:(NSString *)content
                  successBlock:(void(^)(NSString *))successBlock
                   failedBlock:(void(^)(NSString *))failedBlock;

- (void)deleteCommentWithTarget:(NSString *)target
                   withTargetID:(NSString *)target_id
                  withCommentID:(NSString *)comment_id
                   successBlock:(void(^)(NSString *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock;

@end
