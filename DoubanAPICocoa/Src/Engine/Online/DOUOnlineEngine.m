//
//  DOUOnlineEngine.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-14.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUOnlineEngine.h"
#import "DOUErrorConsts.h"
#import "DOUAPIConsts.h"
#import "DOUDiscussionEngine.h"

@implementation DOUOnlineEngine

- (void)getOnlineWithRemoteID:(NSString *)online_id
                 successBlock:(void(^)(DOUOnline *))successBlock
                  failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUOnlineAPIUrl, online_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUOnline *online = [[[DOUOnline alloc] initWithString:[req responseString]] autorelease];
            if (online) {
                if (successBlock) {
                    successBlock(online);
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

- (void)getParticipantedUsersWithRemoteOnlineID:(NSString *)online_id
                                      userStart:(int)start
                                      userCount:(int)count
                                   successBlock:(void(^)(DOUUserArray *))successBlock
                                    failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUOnlineParticipantsAPIUrl, online_id, start, count] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUUserArray *users = [[[DOUUserArray alloc] initWithString:[req responseString]] autorelease];
            if (users) {
                if (successBlock) {
                    successBlock(users);
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

- (void)getDiscussionListWithID:(NSString *)online_id
                   successBlock:(void(^)(DOUDiscussionArray *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock{
    DOUDiscussionEngine *engine = [self getEngine:kDOUDiscussion];
    [engine getDiscussionListWithTarget:@"online" withTargetID:online_id successBlock:successBlock failedBlock:failedBlock];
}

- (void)getOnlineListWithID:(NSString *)online_id
               successBlock:(void(^)(DOUOnlineArray *))successBlock
                failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = kDOUOnlinesAPIUrl;
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUOnlineArray *onlines = [[[DOUOnlineArray alloc] initWithString:[req responseString]] autorelease];
            if (onlines) {
                if (successBlock) {
                    successBlock(onlines);
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

- (void)createOnlineWithTitle:(NSString *)title
                     withDesc:(NSString *)desc
                withBeginTime:(NSString *)begin_time
                  withEndTime:(NSString *)end_time
               withRelatedUrl:(NSString *)url
            withCascadeInvite:(NSString *)cascade_invite
                     withTags:(NSString *)tags
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
    NSString *apiUrl = kDOUOnlinesAPIUrl;
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    NSMutableString *postBody = [NSMutableString stringWithFormat:@"title=%@&desc=%@&begin_time=%@&end_time=%@&related_url=%@&cascade_invite=%@&tags=%@", title, desc, begin_time, end_time,
                                 url, cascade_invite, tags];
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
    [service post:query postBody:postBody callback:completionBlock];
}

- (void)editOnlineWithID:(NSString *)online_id
               WithTitle:(NSString *)title
                   withDesc:(NSString *)desc
              withBeginTime:(NSString *)begin_time
                withEndTime:(NSString *)end_time
             withRelatedUrl:(NSString *)url
          withCascadeInvite:(NSString *)cascade_invite
                   withTags:(NSString *)tags
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
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUOnlineUpdateOnlineAPIUrl, online_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    NSMutableString *putBody = [NSMutableString stringWithFormat:@"title=%@&desc=%@&begin_time=%@&end_time=%@&related_url=%@&cascade_invite=%@&tags=%@", title, desc, begin_time, end_time,
                                 url, cascade_invite, tags];
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
    [service post:query postBody:putBody callback:completionBlock];
}

- (void)deleteOnlineWithID:(NSString *)online_id
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
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUOnlineUpdateOnlineAPIUrl, online_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
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

- (void)likeOnlineWithID:(NSString *)online_id
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
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUOnlineLikeOnlineAPIUrl, online_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
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

- (void)unLikeOnlineWithID:(NSString *)online_id
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
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUOnlineLikeOnlineAPIUrl, online_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
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

- (void)getPhotosWithOnlineID:(NSString *)online_id
                 successBlock:(void(^)(DOUPhotoArray *))successBlock
                  failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUOnlinePhotosAPIUrl, online_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUPhotoArray *photos = [[[DOUPhotoArray alloc] initWithString:[req responseString]] autorelease];
            if (photos) {
                if (successBlock) {
                    successBlock(photos);
                }
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service delete:query callback:completionBlock];
}

- (void)uploadPhotoWithOnlineID:(NSString *)online_id
            withImageData:(NSData *)image_data
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
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUOnlinePhotosAPIUrl, online_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
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
    [service post2:query photoData:image_data description:desc descriptionName:@"desc" callback:completionBlock uploadProgressDelegate:nil];
}

- (void)getUserOnlineListWithUserID:(NSString *)user_id
                       successBlock:(void(^)(DOUOnlineArray *))successBlock
                        failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUOnlineUserOnlinesAPIUrl, user_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUOnlineArray *array = [[[DOUOnlineArray alloc] initWithString:[req responseString]] autorelease];
            if (array) {
                if (successBlock) {
                    successBlock(array);
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

- (void)getUserCreatedOnlineListWithUserID:(NSString *)user_id
                              successBlock:(void(^)(DOUOnlineArray *))successBlock
                               failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUOnlineUserLikedOnlinesAPIUrl, user_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUOnlineArray *array = [[[DOUOnlineArray alloc] initWithString:[req responseString]] autorelease];
            if (array) {
                if (successBlock) {
                    successBlock(array);
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

- (void)attendOnlineWithID:(NSString *)online_id
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
    NSString *apiUrl = [NSString stringWithFormat:kDOUOnlineJoinOnlineAPIUrl, online_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
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
    [service post:query postBody:nil callback:completionBlock];
}

- (void)quitOnlineWithID:(NSString *)online_id
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
    NSString *apiUrl = [NSString stringWithFormat:kDOUOnlineJoinOnlineAPIUrl, online_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
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
