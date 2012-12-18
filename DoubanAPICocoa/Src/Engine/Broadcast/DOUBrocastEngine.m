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

- (void)SayWithSource:(NSString *)source
             withText:(NSString *)text
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
    postBody = [NSMutableString stringWithFormat:@"source=%@&text=%@&rec_title=%@&rec_url=%@&rec_desc=%@", source, text, title, url, desc];
    //if (image_data) {
    //    postBody = [NSMutableString stringWithFormat:@"source=%@&text=%@&image=%@&rec_title=%@&rec_url=%@&rec_desc=%@", source, text, image_data, title, url, desc];
    //}
    NSLog(@"%@", postBody);
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

@end
