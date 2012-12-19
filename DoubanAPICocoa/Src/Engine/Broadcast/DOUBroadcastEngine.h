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

@end
