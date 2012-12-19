//
//  Broadcast.m
//  DoubanAPICocoa
//
//  Created by bettylwx's on 12-12-18.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUBrocastEngine.h"
#import "DOUErrorConsts.h"
#import "DOUAPIConsts.h"

@implementation DOUBrocastEngine

- (void)SayWithSource:(NSString *)text
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

- (void)Say:(NSString *)text
successBlock:(void(^)(NSString *))successBlock
failedBlock:(void(^)(NSString *))failedBlock{
    [self SayWithSource:text withImage:nil withRecTitle:@"" withRecUrl:@"" withRecDesc:@"" successBlock:successBlock failedBlock:failedBlock];
}

- (void)SayWithImage:(NSString *)text
           withImage:(NSData *)image_data
        successBlock:(void(^)(NSString *))successBlock
         failedBlock:(void(^)(NSString *))failedBlock{
    [self SayWithSource:text withImage:image_data withRecTitle:@"" withRecUrl:@"" withRecDesc:@"" successBlock:successBlock failedBlock:failedBlock];
}

- (void)SayWithRec:(NSString *)text
      withRecTitle:(NSString *)title
        withRecUrl:(NSString *)url
       withRecDesc:(NSString *)desc
      successBlock:(void(^)(NSString *))successBlock
       failedBlock:(void(^)(NSString *))failedBlock{
    [self SayWithSource:text withImage:nil withRecTitle:title withRecUrl:url withRecDesc:desc successBlock:successBlock failedBlock:failedBlock];
}

@end
