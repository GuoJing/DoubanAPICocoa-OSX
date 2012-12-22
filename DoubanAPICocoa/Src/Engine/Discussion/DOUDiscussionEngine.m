//
//  DOUDiscussionEngine.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-20.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUDiscussionEngine.h"
#import "DOUErrorConsts.h"
#import "DOUAPIConsts.h"
#import "DOUCommentEngine.h"

@implementation DOUDiscussionEngine

- (void)getDiscussionWithRemoteID:(NSString *)discussion_id
                     successBlock:(void(^)(DOUDiscussion *))successBlock
                      failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUDiscussionAPIUrl, discussion_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUDiscussion *dis = [[[DOUDiscussion alloc] initWithString:[req responseString]] autorelease];
            if (dis) {
                if (successBlock) {
                    successBlock(dis);
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

- (void)editDiscussionWithRemoteID:(NSString *)discussion_id
                         withTitle:(NSString *)title
                       withContent:(NSString *)content
                      successBlock:(void(^)(NSString *))successBlock
                       failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUDiscussionAPIUrl, discussion_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    NSMutableString *putBody = [NSMutableString stringWithFormat:@"title=%@&content=%@", title, content];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
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

- (void)deleteDiscussionWithRemoteID:(NSString *)discussion_id
                        successBlock:(void(^)(NSString *))successBlock
                         failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUDiscussionAPIUrl, discussion_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
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

- (void)writeDiscussionWithTarget:(NSString *)target
                         withTargetID:(NSString *)target_id
                          withTitle:(NSString *)title
                        withContent:(NSString *)content
                       successBlock:(void(^)(NSString *))successBlock
                        failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUDiscussionsAPIUrl, target, target_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    NSMutableString *postBody = [NSMutableString stringWithFormat:@"title=%@&content=%@", title, content];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
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

- (void)getDiscussionListWithTarget:(NSString *)target
                           withTargetID:(NSString *)target_id
                         successBlock:(void(^)(DOUDiscussionArray *))successBlock
                          failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUDiscussionsAPIUrl, target, target_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUDiscussionArray *dises = [[[DOUDiscussionArray alloc] initWithString:[req responseString]] autorelease];
            if (successBlock) {
                successBlock(dises);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

- (void)getCommentListWithID:(NSString *)discussion_id
                successBlock:(void(^)(DOUCommentArray *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock{
    DOUCommentEngine *engine = [self getEngine:kDOUComment];
    [engine getCommentListWithTarget:@"discussion" withTargetID:discussion_id successBlock:successBlock failedBlock:failedBlock];
}

@end
