//
//  Service.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-11-12.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequest.h"

@class ASINetworkQueue;
@interface Service : NSObject {
    @private
    ASINetworkQueue *queue_;
    NSString *apiBaseUrlString_;
    NSString *clientId_;
    NSString *clientSecret_;
}

@property (nonatomic, copy) NSString *apiBaseUrlString;
@property (nonatomic, copy) NSString *clientId;
@property (nonatomic, copy) NSString *clientSecret;

+ (Service *)sharedInstance;

- (BOOL)isValid;

- (void)addRequest:(HttpRequest *)request;


#if NS_BLOCKS_AVAILABLE

- (HttpRequest *)get:(Query *)query callback:(ReqBlock)block;

- (HttpRequest *)post:(Query *)query
                postBody:(NSString *)body
                callback:(ReqBlock)block;

- (HttpRequest *)post:(Query *)query
               photoData:(NSData *)photoData
             description:(NSString *)description
                callback:(ReqBlock)block
  uploadProgressDelegate:(id<ASIProgressDelegate>)progressDelegate;

- (HttpRequest *)delete:(Query *)query callback:(ReqBlock)block;

#endif


- (HttpRequest *)get:(Query *)query delegate:(id<HttpRequestDelegate>)delegate;

- (HttpRequest *)delete:(Query *)query delegate:(id<HttpRequestDelegate>)delegate;

@end
