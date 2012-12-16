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

@implementation DOUEventEngine

- (void)getEventWithRemoteID:(NSString *)event_id
                successBlock:(void(^)(DOUEvent *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock{
    __block DOUEvent *newEvent = nil;
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
    }

    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUEventAPIUrl, event_id];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUEventArray *array = [[DOUEventArray alloc] initWithString:[req responseString]];
            if (array) {
                newEvent = [[DOUEvent alloc] initWithString:[req responseString]];
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
                                  successBlock:(void(^)(DOUUser *))successBlock
                                   failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)getWishedUsersWithRemoteEventID:(NSString *)event_id
                           successBlock:(void(^)(DOUUser *))successBlock
                            failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)getUserEventsWithRemoteUserID:(NSString *)user_id
                         successBlock:(void(^)(DOUEventArray *))successBlock
                          failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)getUserParticipantedEventsWithRemoteUserID:(NSString *)user_id
                                      successBlock:(void(^)(DOUEventArray *))successBlock
                                       failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)getUserWishedEventsWithRemoteUserID:(NSString *)event_id
                               successBlock:(void(^)(DOUEventArray *))successBlock
                                failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)dealloc
{
    [super dealloc];
}
@end
