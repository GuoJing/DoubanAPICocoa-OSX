//
//  Request.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-11-12.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"

extern NSUInteger const kDefaultTimeoutSeconds;
extern NSString * const HTTPRequestErrorDomain;
extern NSString * const OAuthErrorDomain;
extern NSString * const ErrorDomain;

@class HttpRequest;
@class Query;

@protocol HttpRequestDelegate <NSObject>;

@required

- (void)requestFinished:(HttpRequest *)aRequest;
- (void)requestFailed:(HttpRequest *)aRequest;

@end

typedef enum _NetworkErrorType {
    ConnectionFailureErrorType = 1,
    RequestTimedOutErrorType = 2,
    AuthenticationErrorType = 3,
    RequestCancelledErrorType = 4,
    UnableToCreateRequestErrorType = 5,
    InternalErrorWhileBuildingRequestType = 6,
    InternalErrorWhileApplyingCredentialsType = 7,
    FileManagementError = 8,
    TooMuchRedirectionErrorType = 9,
    UnhandledExceptionError = 10,
    CompressionError = 11
} NetworkErrorType;

#if NS_BLOCKS_AVAILABLE
typedef void (^BasicBlock)(void);

typedef void (^ReqBlock)(HttpRequest *);

typedef void (^SizeBlock)(long long size);
#endif

@interface HttpRequest : ASIHTTPRequest

+ (HttpRequest *)requestWithURL:(NSURL *)URL;

+ (HttpRequest *)requestWithURL:(NSURL *)URL target:(id<HttpRequestDelegate>)delegate;

+ (HttpRequest *)requestWithQuery:(Query *)query target:(id<HttpRequestDelegate>)delegate;

#if NS_BLOCKS_AVAILABLE
+ (HttpRequest *)requestWithURL:(NSURL *)URL
                   completionBlock:(BasicBlock)completionHandler;

+ (HttpRequest *)requestWithQuery:(Query *)query
                     completionBlock:(BasicBlock)completionHandler;
#endif

+ (NSError *)adapterError:(NSError *)asiError;

- (NSError *)doubanError;

- (void)appendPostString:(NSString *)string;

@end
