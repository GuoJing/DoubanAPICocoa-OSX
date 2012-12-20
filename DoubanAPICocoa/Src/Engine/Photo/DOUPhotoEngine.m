//
//  DOUPhotoEngine.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-14.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUPhotoEngine.h"
#import "DOUAPIConsts.h"
#import "DOUErrorConsts.h"
#import "DOUCommentEngine.h"

@implementation DOUPhotoEngine

- (void)getPhotoWithRemoteID:(NSString *)photo_id
                successBlock:(void(^)(DOUPhoto *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[NSString alloc] initWithFormat:kDOUPhotoAPIUrl, photo_id];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUPhoto *photo = [[[DOUPhoto alloc] initWithString:[req responseString]] autorelease];
            if (photo) {
                if (successBlock) {
                    successBlock(photo);
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

- (void)editPhotoWithRemoteID:(NSString *)photo_id
                     withDesc:(NSString *)desc
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
    NSString *apiUrl = [[NSString alloc] initWithFormat:kDOUPhotoAPIUrl, photo_id];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];
    NSMutableString *putBody = [NSMutableString stringWithFormat:@"desc=%@", desc];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
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

- (void)deletePhotoWithRemoteID:(NSString *)photo_id
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
    NSString *apiUrl = [[NSString alloc] initWithFormat:kDOUPhotoAPIUrl, photo_id];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
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

- (void)likePhotoWithRemoteID:(NSString *)photo_id
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
    NSString *apiUrl = [[NSString alloc] initWithFormat:kDOUPhotoLikeAPIUrl, photo_id];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
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
    [service post:query postBody:@"" callback:completionBlock];
}

- (void)unLikePhotoWithRemoteID:(NSString *)photo_id
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
    NSString *apiUrl = [[NSString alloc] initWithFormat:kDOUPhotoLikeAPIUrl, photo_id];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
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

- (void)getCommentListWithID:(NSString *)photo_id
                successBlock:(void(^)(DOUCommentArray *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock{
    DOUCommentEngine *engine = [self getEngine:kDOUComment];
    [engine getCommentListWithTarget:@"photo" withTargetID:photo_id successBlock:successBlock failedBlock:failedBlock];
}

@end
