//
//  Broadcast.m
//  DoubanAPICocoa
//
//  Created by bettylwx's on 12-12-18.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUBroadcastEngine.h"
#import "DOUErrorConsts.h"
#import "DOUAPIConsts.h"

@implementation DOUBroadcastEngine

- (void)sayWithSource:(NSString *)text
            withImage:(NSData *)image_data
         withRecTitle:(NSString *)title
           withRecUrl:(NSString *)url
          withRecDesc:(NSString *)desc
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
    NSString *apiUrl = kDOUWriteBroadcastAPIUrl;
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];
    NSMutableString *postBody = nil;
    postBody = [NSMutableString stringWithFormat:@"source=%@&text=%@&rec_title=%@&rec_url=%@&rec_desc=%@", self.apiKey, text, title, url, desc];
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
    if (image_data) {
        [service post2:query photoData:image_data description:text descriptionName:@"text" callback:completionBlock uploadProgressDelegate:nil];
    } else {
        [service post:query postBody:postBody callback:completionBlock];
    }
}

- (void)say:(NSString *)text
successBlock:(void(^)(NSString *))successBlock
failedBlock:(void(^)(NSString *))failedBlock{
    [self sayWithSource:text withImage:nil withRecTitle:@"" withRecUrl:@"" withRecDesc:@"" successBlock:successBlock failedBlock:failedBlock];
}

- (void)sayWithImage:(NSString *)text
           withImage:(NSData *)image_data
        successBlock:(void(^)(NSString *))successBlock
         failedBlock:(void(^)(NSString *))failedBlock{
    [self sayWithSource:text withImage:image_data withRecTitle:@"" withRecUrl:@"" withRecDesc:@"" successBlock:successBlock failedBlock:failedBlock];
}

- (void)sayWithRec:(NSString *)text
      withRecTitle:(NSString *)title
        withRecUrl:(NSString *)url
       withRecDesc:(NSString *)desc
      successBlock:(void(^)(NSString *))successBlock
       failedBlock:(void(^)(NSString *))failedBlock{
    [self sayWithSource:text withImage:nil withRecTitle:title withRecUrl:url withRecDesc:desc successBlock:successBlock failedBlock:failedBlock];
}

- (void)getHomeTimeLine:(void(^)(DOUBroadcastArray *))successBlock
            failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = kDOUBroadcastByFriendsAPIUrl;
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUBroadcastArray *array = [[DOUBroadcastArray alloc] initWithString:[req responseString]];
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
@end
