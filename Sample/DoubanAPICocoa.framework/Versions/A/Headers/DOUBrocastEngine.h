//
//  Broadcast.h
//  DoubanAPICocoa
//
//  Created by bettylwx's on 12-12-18.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUEngine.h"

@interface DOUBrocastEngine : DOUEngine

- (void)SayWithSource:(NSString *)text
            withImage:(NSData *)image_data
         withRecTitle:(NSString *)title
           withRecUrl:(NSString *)url
          withRecDesc:(NSString *)desc
    successBlock:(void(^)(NSString *))successBlock
    failedBlock:(void(^)(NSString *))failedBlock;

- (void)Say:(NSString *)text
    successBlock:(void(^)(NSString *))successBlock
    failedBlock:(void(^)(NSString *))failedBlock;

- (void)SayWithImage:(NSString *)text
               withImage:(NSData *)image_data
            successBlock:(void(^)(NSString *))successBlock
             failedBlock:(void(^)(NSString *))failedBlock;

- (void)SayWithRec:(NSString *)text
      withRecTitle:(NSString *)title
        withRecUrl:(NSString *)url
       withRecDesc:(NSString *)desc
      successBlock:(void(^)(NSString *))successBlock
       failedBlock:(void(^)(NSString *))failedBlock;

@end
