//
//  Request.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-11-12.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "HttpRequest.h"


@implementation HttpRequest

NSUInteger const kDefaultTimeoutSeconds = 30;
NSString * const HTTPRequestErrorDomain = @"HTTPRequestErrorDomain";
NSString * const OAuthErrorDomain = @"OAuthErrorDomain";
NSString * const ErrorDomain = @"ErrorDomain";

+ (HttpRequest *)requestWithURL:(NSURL *)URL {
    HttpRequest *req = [[[HttpRequest alloc] initWithURL:URL] autorelease];
    req.useCookiePersistence = NO;
    //[req setValidatesSecureCertificate:NO];
    [req setAllowCompressedResponse:YES];// YES is the default
    [req setTimeOutSeconds:kDefaultTimeoutSeconds];
    return req;
}


+ (HttpRequest *)requestWithURL:(NSURL *)URL target:(id<HttpRequestDelegate>)delegate {
    HttpRequest *req = [[self class] requestWithURL:URL];
    [req setDelegate:delegate];
    [req setDidFinishSelector:@selector(requestFinished:)];
    [req setDidFailSelector:@selector(requestFailed:)];
    return req;
}


+ (HttpRequest *)requestWithQuery:(Query *)query target:(id<HttpRequestDelegate>)delegate {
    HttpRequest *req = [[self class] requestWithURL:[query requestURL] target:delegate];
    return req;
}

#if NS_BLOCKS_AVAILABLE

+ (HttpRequest *)requestWithURL:(NSURL *)URL
                   completionBlock:(BasicBlock)completionHandler {
    HttpRequest *req = [[self class] requestWithURL:URL];
    [req setCompletionBlock:completionHandler];
    [req setFailedBlock:completionHandler];
    return req;
}


+ (HttpRequest *)requestWithQuery:(Query *)query
                     completionBlock:(BasicBlock)completionHandler {
    HttpRequest *req = [[self class] requestWithURL:[query requestURL]];
    [req setCompletionBlock:completionHandler];
    [req setFailedBlock:completionHandler];
    return req;
}
#endif


+ (NSError *)adapterError:(NSError *)asiError {
    NSError *doubanError;
    switch ([asiError code]) {
        case ASIConnectionFailureErrorType:
            doubanError = [NSError errorWithDomain:HTTPRequestErrorDomain
                                              code:ConnectionFailureErrorType
                                          userInfo:asiError.userInfo];
            break;
        case ASIRequestTimedOutErrorType:
            doubanError = [NSError errorWithDomain:HTTPRequestErrorDomain
                                              code:RequestTimedOutErrorType
                                          userInfo:asiError.userInfo];
            break;
        case AuthenticationErrorType:
            doubanError = [NSError errorWithDomain:HTTPRequestErrorDomain
                                              code:AuthenticationErrorType
                                          userInfo:asiError.userInfo];
            break;
        case RequestCancelledErrorType:
            doubanError = [NSError errorWithDomain:HTTPRequestErrorDomain
                                              code:RequestCancelledErrorType
                                          userInfo:asiError.userInfo];
            break;
        case UnableToCreateRequestErrorType:
            doubanError = [NSError errorWithDomain:HTTPRequestErrorDomain
                                              code:UnableToCreateRequestErrorType
                                          userInfo:asiError.userInfo];
            break;
        case InternalErrorWhileBuildingRequestType:
            doubanError = [NSError errorWithDomain:HTTPRequestErrorDomain
                                              code:InternalErrorWhileBuildingRequestType
                                          userInfo:asiError.userInfo];
            break;
        case InternalErrorWhileApplyingCredentialsType:
            doubanError = [NSError errorWithDomain:HTTPRequestErrorDomain
                                              code:InternalErrorWhileApplyingCredentialsType
                                          userInfo:asiError.userInfo];
            break;
        case FileManagementError:
            doubanError = [NSError errorWithDomain:HTTPRequestErrorDomain
                                              code:FileManagementError
                                          userInfo:asiError.userInfo];
            break;
        case TooMuchRedirectionErrorType:
            doubanError = [NSError errorWithDomain:HTTPRequestErrorDomain
                                              code:TooMuchRedirectionErrorType
                                          userInfo:asiError.userInfo];
            break;
        case UnhandledExceptionError:
            doubanError = [NSError errorWithDomain:HTTPRequestErrorDomain
                                              code:UnhandledExceptionError
                                          userInfo:asiError.userInfo];
            break;
        case CompressionError:
            doubanError = [NSError errorWithDomain:HTTPRequestErrorDomain
                                              code:CompressionError
                                          userInfo:asiError.userInfo];
            break;
        default:
            doubanError = asiError;
            break;
    }
    return doubanError;
}


- (NSError *)doubanError {
    NSError *asiError = [super error];
    // handle the http error
    if (asiError) {
        return [[self class] adapterError:asiError];
    }
    
    int statusCode = [self responseStatusCode];
    if (statusCode == 200 || statusCode == 201 || statusCode == 202) {
        // success
        return nil;
    }
    else if (statusCode == 400) {
        // handle the oauth error
        NSString *response = [self responseString];
        NSDictionary *dic = [response JSONValue];
        NSInteger code = 0;
        if (dic) {
            code = [[dic objectForKey:@"code"] integerValue];
        }
        
        if (dic) {
            NSError *oauthError = [NSError errorWithDomain:OAuthErrorDomain
                                                      code:code
                                                  userInfo:dic];
            return oauthError;
        }
    }
    
    NSError *otherError = [NSError errorWithDomain:ErrorDomain
                                              code:error.code
                                          userInfo:nil];
    return otherError;
    
}

- (void)appendPostString:(NSString *)string {
    [super appendPostData:[string dataUsingEncoding:NSUTF8StringEncoding]];
}

@end
