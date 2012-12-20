//
//  DOUPhotoEngine.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-14.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUEngine.h"
#import "DOUPhoto.h"
#import "DOUCommentArray.h"

@interface DOUPhotoEngine : DOUEngine

- (void)getPhotoWithRemoteID:(NSString *)photo_id
                successBlock:(void(^)(DOUPhoto *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock;

- (void)editPhotoWithRemoteID:(NSString *)photo_id
                     withDesc:(NSString *)desc
                successBlock:(void(^)(NSString *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock;

- (void)deletePhotoWithRemoteID:(NSString *)photo_id
                successBlock:(void(^)(NSString *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock;

- (void)likePhotoWithRemoteID:(NSString *)photo_id
                   successBlock:(void(^)(NSString *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock;

- (void)unLikePhotoWithRemoteID:(NSString *)photo_id
                   successBlock:(void(^)(NSString *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock;

- (void)getCommentListWithID:(NSString *)photo_id
       successBlock:(void(^)(DOUCommentArray *))successBlock
        failedBlock:(void(^)(NSString *))failedBlock;
@end
