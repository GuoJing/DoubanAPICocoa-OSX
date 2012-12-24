//
//  DOUMusicEngine.m
//  DoubanAPICocoa
//
//  Created by bettylwx's on 12-12-18.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUMusicEngine.h"
#import "DOUErrorConsts.h"
#import "DOUAPIConsts.h"

@implementation DOUMusicEngine

- (void)getMusicWithRemoteID:(NSString *)music_id
                successBlock:(void(^)(DOUMusic *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock{
    __block DOUMusic *newMusic = nil;
    [self checkServiceFailedWhen:failedBlock];
    
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUMusicAPIUrl, music_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUMusicArray *array = [[[DOUMusicArray alloc] initWithString:[req responseString]] autorelease];
            if (array) {
                newMusic = [[[DOUMusic alloc] initWithString:[req responseString]] autorelease];
                if (successBlock) {
                    successBlock(newMusic);
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

- (void)searchMusics:(NSString *)search_text
               start:(int)start
               count:(int)count
        successBlock:(void(^)(DOUMusicArray *))successBlock
         failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUMusicSearchAPIUrl, search_text, start, count];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUMusicArray *array = [[[DOUMusicArray alloc] initWithString:[req responseString]] autorelease];
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

- (void)getTagsWithRemoteMusicID:(NSString *)music_id
                    successBlock:(void(^)(DOUTagArray *))successBlock
                     failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUMusicTagsAPIUrl, music_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUTagArray *array = [[[DOUTagArray alloc] initWithString:[req responseString]] autorelease];
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

- (void)writeReview:(NSString *)music_id
              title:(NSString *)title
            content:(NSString *)content
             rating:(int)rating
       successBlock:(void(^)(NSString *))successBlock
        failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    NSMutableString *postBody = [NSMutableString stringWithFormat:@"music=%@&title=%@&content=%@&rating=%d", music_id , title, content, rating];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUMusicWriteReviewAPIUrl, music_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest * req) {
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(kDOUErrorOK);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service post:query postBody:postBody callback:completionBlock];
}

- (void)editReview:(NSString *)review_id
             title:(NSString *)title
           content:(NSString *)content
            rating:(int)rating
      successBlock:(void(^)(NSString *))successBlock
       failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    NSMutableString *putBody = [NSMutableString stringWithFormat:@"&title=%@&content=%@&rating=%d", title, content, rating];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUMusicEditReviewAPIUrl, review_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest * req) {
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(kDOUErrorOK);
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
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUMusicEditReviewAPIUrl, review_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest * req) {
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(kDOUErrorOK);
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
