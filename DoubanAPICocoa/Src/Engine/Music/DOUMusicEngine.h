//
//  DOUMusicEngine.h
//  DoubanAPICocoa
//
//  Created by bettylwx's on 12-12-18.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUEngine.h"
#import "DOUMusic.h"
#import "DOUMusicArray.h"
#import "DOUTagArray.h"

@interface DOUMusicEngine : DOUEngine

- (void)getMusicWithRemoteID:(NSString *)music_id
                successBlock:(void(^)(DOUMusic *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock;

- (void)searchMusics:(NSString *)search_text
               start:(int)start
               count:(int)count
        successBlock:(void(^)(DOUMusicArray *))successBlock
         failedBlock:(void(^)(NSString *))failedBlock;

- (void)getTagsWithRemoteMusicID:(NSString *)music_id
                    successBlock:(void(^)(DOUTagArray *))successBlock
                     failedBlock:(void(^)(NSString *))failedBlock;

- (void)writeReview:(NSString *)music_id
              title:(NSString *)title
            content:(NSString *)content
             rating:(int)rating
       successBlock:(void(^)(NSString *))successBlock
        failedBlock:(void(^)(NSString *))failedBlock;

- (void)editReview:(NSString *)review_id
             title:(NSString *)title
           content:(NSString *)content
            rating:(int)rating
      successBlock:(void(^)(NSString *))successBlock
       failedBlock:(void(^)(NSString *))failedBlock;

- (void)deleteReview:(NSString *)review_id
        successBlock:(void(^)(NSString *))successBlock
         failedBlock:(void(^)(NSString *))failedBlock;

@end
