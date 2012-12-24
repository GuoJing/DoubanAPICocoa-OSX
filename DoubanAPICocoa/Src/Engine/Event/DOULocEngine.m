//
//  DOULocEngine.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-14.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOULocEngine.h"

#import "DOUAPIConsts.h"
#import "DOUAPIConfig.h"
#import "DOULocArray.h"
#import "DOUService.h"
#import "DOUOAuthService.h"
#import "DOUAPIConsts.h"
#import "DOUQuery.h"
#import "DOUErrorConsts.h"

@implementation DOULocEngine

- (void)getLocWithRemoteID:(NSString *)loc_id
              successBlock:(void(^)(DOULoc *))successBlock
               failedBlock:(void(^)(NSString *))failedBlock{
    __block DOULoc *newLoc = nil;
    [self checkServiceFailedWhen:failedBlock];
    
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOULocAPIUrl, loc_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOULocArray *array = [[[DOULocArray alloc] initWithString:[req responseString]] autorelease];
            if (array) {
                newLoc = [[DOULoc alloc] initWithString:[req responseString]];
                if (successBlock) {
                    successBlock(newLoc);
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

- (void)getLocListWithRemote:successBlock:(void(^)(DOULocArray *))successListBlock
                 failedBlock:(void(^)(NSString *))failedListBlock{
    if(![self isServiceValid]) {
        if (failedListBlock) {
            failedListBlock(kDOUErrorServiceError);
        }
        return;
    }
    
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = kDOULocListAPIUrl;
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOULocArray *array = [[[DOULocArray alloc] initWithString:[req responseString]] autorelease];
            if (array) {
                if (successListBlock) {
                    successListBlock(array);
                }
            }
        } else {
            if (failedListBlock) {
                failedListBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

@end
