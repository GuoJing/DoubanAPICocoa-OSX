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

- (void)sayWithSource:(NSString *)text
            withImage:(NSData *)image_data
         withRecTitle:(NSString *)title
           withRecUrl:(NSString *)url
          withRecDesc:(NSString *)desc
    successBlock:(void(^)(NSString *))successBlock
    failedBlock:(void(^)(NSString *))failedBlock;

- (void)say:(NSString *)text
    successBlock:(void(^)(NSString *))successBlock
    failedBlock:(void(^)(NSString *))failedBlock;

- (void)sayWithImage:(NSString *)text
               withImage:(NSData *)image_data
            successBlock:(void(^)(NSString *))successBlock
             failedBlock:(void(^)(NSString *))failedBlock;

- (void)sayWithRec:(NSString *)text
      withRecTitle:(NSString *)title
        withRecUrl:(NSString *)url
       withRecDesc:(NSString *)desc
      successBlock:(void(^)(NSString *))successBlock
       failedBlock:(void(^)(NSString *))failedBlock;

- (void)getHomeTimeLine:(void(^)(DOUBroadcastArray *))successBlock
            failedBlock:(void(^)(NSString *))failedBlock;

@end
