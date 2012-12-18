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

- (void)SayWithSource:(NSString *)source
             withText:(NSString *)text
            withImage:(NSData *)image_data
         withRecTitle:(NSString *)title
           withRecUrl:(NSString *)url
          withRecDesc:(NSString *)desc
    successBlock:(void(^)(NSString *))successBlock
    failedBlock:(void(^)(NSString *))failedBlock;

@end
