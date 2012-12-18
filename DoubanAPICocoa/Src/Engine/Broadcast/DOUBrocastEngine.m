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
            withImage:(NSImage *)image
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
    
    NSData *image_data = nil;
    NSString *image_byte = @"";
    if (image) {
        image_data = [image TIFFRepresentation];
        image_byte = [[NSString alloc] initWithData:image_data encoding:NSUTF8StringEncoding];
    }
    
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = kDOUWriteBroadcastAPIUrl;
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];
    NSMutableString *postBody = [NSMutableString stringWithFormat:@"source=%@&text=%@&image=%@&rec_title=%@&rec_url=%@&rec_desc=%@", source, text, image_byte, title, url, desc];
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

@end
