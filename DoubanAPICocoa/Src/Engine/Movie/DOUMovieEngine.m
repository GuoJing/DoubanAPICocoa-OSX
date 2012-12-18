//
//  DOUMovieEngine.m
//  DoubanAPICocoa
//
//  Created by bettylwx's on 12-12-18.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUMovieEngine.h"
#import "DOUErrorConsts.h"
#import "DOUAPIConsts.h"

@implementation DOUMovieEngine

- (void)getMovieWithRemoteID:(NSString *)movie_id
                successBlock:(void(^)(DOUMovie *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock{
    __block DOUMovie *newMovie = nil;
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUMovieAPIUrl, movie_id];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUMovieArray *array = [[DOUMovieArray alloc] initWithString:[req responseString]];
            if (array) {
                newMovie = [[DOUMovie alloc] initWithString:[req responseString]];
                if (successBlock) {
                    successBlock(newMovie);
                }
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}


- (void)getMovieWithRemoteIMDB:(NSString *)isbn
                  successBlock:(void(^)(DOUMovie *))successBlock
                   failedBlock:(void(^)(NSString *))failedBlock{
    __block DOUMovie *newMovie = nil;
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUMovieWithIMDBAPIUrl, isbn];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUMovieArray *array = [[DOUMovieArray alloc] initWithString:[req responseString]];
            if (array) {
                newMovie = [[DOUMovie alloc] initWithString:[req responseString]];
                if (successBlock) {
                    successBlock(newMovie);
                }
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

- (void)searchMovies:(NSString *)search_text
               start:(int)start
               count:(int)count
        successBlock:(void(^)(DOUMovieArray *))successBlock
         failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUMovieSearchAPIUrl, search_text, start, count];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUMovieArray *array = [[DOUMovieArray alloc] initWithString:[req responseString]];
            if (successBlock) {
                successBlock(array);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

- (void)getTagsWithRemoteMovieID:(NSString *)movie_id
                    successBlock:(void(^)(DOUTagArray *))successBlock
                     failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUMovieTagsAPIUrl, movie_id];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUTagArray *array = [[DOUTagArray alloc] initWithString:[req responseString]];
            if (successBlock) {
                successBlock(array);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

- (void)writeReview:(NSString *)movie_id
              title:(NSString *)title
            content:(NSString *)content
             rating:(int)rating
       successBlock:(void(^)(NSString *))successBlock
        failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    NSMutableString *postBody = [NSMutableString stringWithFormat:@"movie=%@&title=%@&content=%@&rating=%d", movie_id , title, content, rating];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUMovieWriteReviewAPIUrl, movie_id];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];
    DOUReqBlock completionBlock = ^(DOUHttpRequest * req) {
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(@"success");
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service post:query postBody:postBody callback:completionBlock];
}

- (void)eidtReview:(NSString *)review_id
             title:(NSString *)title
           content:(NSString *)content
            rating:(int)rating
      successBlock:(void(^)(NSString *))successBlock
       failedBlock:(void(^)(NSString *))failedBlock{    
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    NSMutableString *putBody = [NSMutableString stringWithFormat:@"&title=%@&content=%@&rating=%d", title, content, rating];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUMovieEditReviewAPIUrl, review_id];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];
    DOUReqBlock completionBlock = ^(DOUHttpRequest * req) {
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(@"success");
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service put:query putBody:putBody callback:completionBlock];
}

- (void)deleteReview:(NSString *)review_id
        successBlock:(void(^)(NSString *))successBlock
         failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUMovieEditReviewAPIUrl, review_id];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];
    DOUReqBlock completionBlock = ^(DOUHttpRequest * req) {
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(@"success");
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service delete:query callback:completionBlock];
}

@end