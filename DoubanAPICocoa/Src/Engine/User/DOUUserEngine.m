//
//  DOUUserEngine.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-14.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUUserEngine.h"
#import "DOUErrorConsts.h"
#import "DOUAPIConsts.h"

@implementation DOUUserEngine

- (void)getUserWithRemoteID:(NSString *)user_id
               successBlock:(void(^)(DOUUser *))successBlock
                failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUUserAPIUrl, user_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUUser *user = [[[DOUUser alloc] initWithString:[req responseString]] autorelease];
            if (user) {
                if (successBlock) {
                    successBlock(user);
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

- (void)getUserFollowingWithUserID:(NSString *)user_id
                      successBlock:(void(^)(DOUBroadcastUserArray *))successBlock
                       failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUBroadcastUserFollowingAPIUrl, user_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUBroadcastUserArray *array = [[[DOUBroadcastUserArray alloc] initWithString:[req responseString]] autorelease];
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

- (void)getUserFollowersWithUserID:(NSString *)user_id
                      successBlock:(void(^)(DOUBroadcastUserArray *))successBlock
                       failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUBroadcastUserFollowersAPIUrl, user_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUBroadcastUserArray *array = [[[DOUBroadcastUserArray alloc] initWithString:[req responseString]] autorelease];
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

- (void)getUserFollowInCommonWithUserID:(NSString *)user_id
                           successBlock:(void(^)(DOUBroadcastUserArray *))successBlock
                            failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUBroadcastUserFollowInCommonAPIUrl, user_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUBroadcastUserArray *array = [[[DOUBroadcastUserArray alloc] initWithString:[req responseString]] autorelease];
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

- (void)searchUser:(NSString *)text
      successBlock:(void(^)(DOUBroadcastUserArray *))successBlock
       failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUBroadcastUserSearchAPIUrl, text] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUBroadcastUserArray *array = [[[DOUBroadcastUserArray alloc] initWithString:[req responseString]] autorelease];
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

- (void)followSomeOneWithUserID:(NSString *)user_id
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
    NSString *apiUrl = kDOUBroadcastUserFollowAPIUrl;
    NSMutableString *postBody = [NSMutableString stringWithFormat:@"user_id=%@&source=%@", user_id, self.apiKey];
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
    [service post:query postBody:postBody callback:completionBlock];
}

- (void)unfollowSomeOneWithUserID:(NSString *)user_id
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
    NSString *apiUrl = kDOUBroadcastUserUnFollowAPIUrl;
    NSMutableString *postBody = [NSMutableString stringWithFormat:@"user_id=%@&source=%@", user_id, self.apiKey];
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
    [service post:query postBody:postBody callback:completionBlock];
}

- (void)blockSomeOneWithUserID:(NSString *)user_id
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
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUBroadcastUserBlockAPIUrl, user_id] autorelease];
    NSMutableString *postBody = [NSMutableString stringWithFormat:@"user_id=%@", user_id];
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
    [service post:query postBody:postBody callback:completionBlock];
}

- (void)getRelationShopWithSourceID:(NSString *)source_id
                           targetID:(NSString *)target_id
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
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUBroadcastUserFriendShopAPIurl, self.apiKey, source_id, target_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock([req responseString]);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

@end
