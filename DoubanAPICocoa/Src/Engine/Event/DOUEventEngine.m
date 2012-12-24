//
//  DOUEventEngine.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-13.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUEventEngine.h"
#import "DOUAPIConfig.h"
#import "DOUEvent.h"
#import "DOUEventArray.h"
#import "DOUService.h"
#import "DOUOAuthService.h"
#import "DOUAPIConsts.h"
#import "DOUErrorConsts.h"
#import "DOUQuery.h"
#import "DOUUserArray.h"
#import "DOUDiscussionEngine.h"

@implementation DOUEventEngine

- (void)getEventWithRemoteID:(NSString *)event_id
                successBlock:(void(^)(DOUEvent *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock{
    __block DOUEvent *newEvent = nil;
    [self checkServiceFailedWhen:failedBlock];

    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUEventAPIUrl, event_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUEventArray *array = [[[DOUEventArray alloc] initWithString:[req responseString]] autorelease];
            if (array) {
                newEvent = [[[DOUEvent alloc] initWithString:[req responseString]] autorelease];
                if (successBlock) {
                    successBlock(newEvent);
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

- (void)getParticipantedUsersWithRemoteEventID:(NSString *)event_id
                                     userStart:(int)start
                                     userCount:(int)count
                                  successBlock:(void(^)(DOUUserArray *))successBlock
                                   failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUEventParticipantsAPIUrl, event_id, start, count];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUUserArray *array = [[[DOUUserArray alloc] initWithString:[req responseString]] autorelease];
            if (successBlock) {
                successBlock(array);
            }
        } else {
            if(failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

- (void)getWishedUsersWithRemoteEventID:(NSString *)event_id
                              userStart:(int)start
                              userCount:(int)count
                           successBlock:(void(^)(DOUUserArray *))successBlock
                            failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUEventWishersAPIUrl, event_id, start, count];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUUserArray *array = [[[DOUUserArray alloc] initWithString:[req responseString]] autorelease];
            if (successBlock) {
                successBlock(array);
            }
        } else {
            if(failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

- (void)getUserEventsWithRemoteUserID:(NSString *)user_id
                            userStart:(int)start
                            userCount:(int)count
                         successBlock:(void(^)(DOUEventArray *))successBlock
                          failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUEventUserEventsAPIUrl, user_id, start, count];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUEventArray *array = [[[DOUEventArray alloc] initWithString:[req responseString]] autorelease];
            if (successBlock) {
                successBlock(array);
            }
        } else {
            if(failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

- (void)getUserParticipantedEventsWithRemoteUserID:(NSString *)user_id
                                         userStart:(int)start
                                         userCount:(int)count
                                      successBlock:(void(^)(DOUEventArray *))successBlock
                                       failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUEventParticipantedEventsAPIUrl, user_id, start, count];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUEventArray *array = [[[DOUEventArray alloc] initWithString:[req responseString]] autorelease];
            if (successBlock) {
                successBlock(array);
            }
        } else {
            if(failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

- (void)getUserWishedEventsWithRemoteUserID:(NSString *)user_id
                                  userStart:(int)start
                                  userCount:(int)count
                               successBlock:(void(^)(DOUEventArray *))successBlock
                                failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUEventWishedEventsAPIUrl, user_id, start, count];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUEventArray *array = [[[DOUEventArray alloc] initWithString:[req responseString]] autorelease];
            if (successBlock) {
                successBlock(array);
            }
        } else {
            if(failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

- (void)attendEventWithID:(NSString *)event_id
       successBlock:(void(^)(NSString *))successBlock
        failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUEventAttendEventAPIUrl, event_id];
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
    [service post:query postBody:nil callback:completionBlock];
}

- (void)quitAttendEventWithID:(NSString *)event_id
           successBlock:(void(^)(NSString *))successBlock
            failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUEventAttendEventAPIUrl, event_id];
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

- (void)wishEventWithID:(NSString *)event_id
     successBlock:(void(^)(NSString *))successBlock
      failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUEventWishEventAPIUrl, event_id];
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
    [service post:query postBody:nil callback:completionBlock];
}

- (void)quitWishEventWithID:(NSString *)event_id
         successBlock:(void(^)(NSString *))successBlock
          failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUEventWishEventAPIUrl, event_id];
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

- (void)getDiscussionListWithID:(NSString *)event_id
                   successBlock:(void(^)(DOUDiscussionArray *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock{
    DOUDiscussionEngine *engine = [self getEngine:kDOUDiscussion];
    [engine getDiscussionListWithTarget:@"event" withTargetID:event_id successBlock:successBlock failedBlock:failedBlock];
    
}

- (void)uploadPhotoWithOnlineID:(NSString *)event_id
                  withImageData:(NSData *)image_data
                       withDesc:(NSString *)desc
                   successBlock:(void(^)(NSString *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUEventPhotosAPIUrl, event_id];
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
    [service post2:query photoData:image_data description:desc descriptionName:@"desc" callback:completionBlock uploadProgressDelegate:nil];
}

@end
