//
//  DOUMovieEngine.h
//  DoubanAPICocoa
//
//  Created by bettylwx's on 12-12-18.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUEngine.h"
#import "DOUMovie.h"
#import "DOUMovieArray.h"
#import "DOUTagArray.h"

@interface DOUMovieEngine : DOUEngine

- (void)getMovieWithRemoteID:(NSString *)movie_id
               successBlock:(void(^)(DOUMovie *))successBlock
                failedBlock:(void(^)(NSString *))failedBlock;


- (void)getMovieWithRemoteIMDB:(NSString *)isbn
                 successBlock:(void(^)(DOUMovie *))successBlock
                  failedBlock:(void(^)(NSString *))failedBlock;

- (void)searchMovies:(NSString *)search_text
              start:(int)start
              count:(int)count
       successBlock:(void(^)(DOUMovieArray *))successBlock
        failedBlock:(void(^)(NSString *))failedBlock;

- (void)getTagsWithRemoteMovieID:(NSString *)movie_id
                   successBlock:(void(^)(DOUTagArray *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock;

- (void)writeReview:(NSString *)movie_id
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
