//
//  DOUAlbumEngine.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-14.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUEngine.h"
#import "DOUAlbum.h"
#import "DOUAlbumArray.h"
#import "DOUPhotoArray.h"

@interface DOUAlbumEngine : DOUEngine

- (void)getAlbumWithRemoteID:(NSString *)album_id
                successBlock:(void(^)(DOUAlbum *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock;

- (void)getPhotoListWithRemoteID:(NSString *)album_id
                successBlock:(void(^)(DOUPhotoArray *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock;

- (void)createAlbumWithTitle:(NSString *)title
                    withDesc:(NSString *)desc
                   withOrder:(NSString *)order
                 withPrivacy:(NSString *)privacy
                successBlock:(void(^)(NSString *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock;

- (void)editAlbumWithID:(NSString *)album_id
              withTitle:(NSString *)title
               withDesc:(NSString *)desc
              withOrder:(NSString *)order
            withPrivacy:(NSString *)privacy
           successBlock:(void(^)(NSString *))successBlock
            failedBlock:(void(^)(NSString *))failedBlock;

- (void)deleteAlbumWithID:(NSString *)album_id
             successBlock:(void(^)(NSString *))successBlock
              failedBlock:(void(^)(NSString *))failedBlock;

- (void)likeAlbumWithID:(NSString *)album_id
             successBlock:(void(^)(NSString *))successBlock
              failedBlock:(void(^)(NSString *))failedBlock;

- (void)unlikeAlbumWithID:(NSString *)album_id
           successBlock:(void(^)(NSString *))successBlock
            failedBlock:(void(^)(NSString *))failedBlock;

- (void)getUserAlbumListWithUserID:(NSString *)user_id
           successBlock:(void(^)(DOUAlbumArray *))successBlock
            failedBlock:(void(^)(NSString *))failedBlock;

- (void)getUserLikedAlbumListWithUserID:(NSString *)user_id
                      successBlock:(void(^)(DOUAlbumArray *))successBlock
                       failedBlock:(void(^)(NSString *))failedBlock;

- (void)uploadPhotoWithAlbumID:(NSString *)album_id
                     imageData:(NSData *)image_data
                      withDesc:(NSString *)desc
                  successBlock:(void(^)(NSString *))successBlock
                   failedBlock:(void(^)(NSString *))failedBlock;

@end
