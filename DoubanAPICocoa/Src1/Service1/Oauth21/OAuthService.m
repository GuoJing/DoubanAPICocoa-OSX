//
//  OAuthService.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-11-12.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "OAuthService.h"
#import "OAuth2.h"
#import "OAuthStore.h"
#import "SBJson.H"

@interface OAuthService () <ASIHTTPRequestDelegate>
@end

@implementation OAuthService

@synthesize delegate = delegate_;

@synthesize clientId = clientId_;
@synthesize clientSecret = clientSecret_;
@synthesize authorizationURL = authorizationURL_;
@synthesize callbackURL = callbackURL_;
@synthesize authorizationCode = authorizationCode_;
@synthesize accessToken = accessToken_;
@synthesize refreshToken = refreshToken_;

static OAuthService *myInstance = nil;

+ (OAuthService *)sharedInstance {
    
    @synchronized(self) {
        if (myInstance == nil) {
            myInstance = [[OAuthService alloc] init];
        }
        
    }
    return myInstance;
}


+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (myInstance == nil) {
            myInstance = [super allocWithZone:zone];
            return myInstance; // assignment and return on first allocation
        }
    }
    return nil;
}


- (id)copyWithZone:(NSZone *)zone {
    return self;
}


- (id)retain {
    return self;
}


- (NSUInteger)retainCount {
    return UINT_MAX;
}


- (oneway void)release {
    //nothing
}


- (id)autorelease {
    return self;
}



- (void)dealloc {
    [clientId_ release];
    [clientSecret_ release];
    [accessToken_ release];
    [authorizationCode_ release];
    [callbackURL_ release];
    [authorizationURL_ release];
    [super dealloc];
}



#pragma mark - Auth2 actions

- (ASIFormDataRequest *)formRequest {
    NSURL *URL = [NSURL URLWithString:authorizationURL_];
    ASIFormDataRequest *req = [ASIFormDataRequest requestWithURL:URL];
    [req setRequestMethod:@"POST"];
    [req setValidatesSecureCertificate:NO];
    [req setAllowCompressedResponse:YES]; // YES is the default
    [req setTimeOutSeconds:kDefaultTimeoutSeconds];
    
    [req setPostValue:self.clientId forKey:kClientIdKey];
    [req setPostValue:self.clientSecret forKey:kClientSecretKey];
    [req setPostValue:self.callbackURL forKey:kRedirectURIKey];
    
    return req;
}


- (void)validateAuthorizationCode {
    ASIFormDataRequest *req = [self formRequest];
    [req setDelegate:self];
    [req setPostValue:@"authorization_code" forKey:kGrantTypeKey];
    [req setPostValue:self.authorizationCode forKey:kOAuth2ResponseTypeCode];
    [req startAsynchronous];
}


- (void)validateUsername:(NSString *)username password:(NSString *)password {
    ASIFormDataRequest *req = [self formRequest];
    [req setDelegate:self];
    
    [req setPostValue:kGrantTypePassword forKey:kGrantTypeKey];
    [req setPostValue:username forKey:kUsernameKey];
    [req setPostValue:password forKey:kPasswordKey];
    
    [req startAsynchronous];
}


- (NSError *)validateRefresh {
    ASIFormDataRequest *req = [self formRequest];
    [req setPostValue:kGrantTypeRefreshToken forKey:kGrantTypeKey];
    [req setPostValue:self.refreshToken forKey:kOAuth2ResponseTypeToken];
    [req startSynchronous];
    
    NSError *error = [req error];
    if (!error) {
        NSString* responseStr = [req responseString];
        NSDictionary *dic = [responseStr JSONValue];
        OAuthStore *store = [OAuthStore sharedInstance];
        [store updateWithSuccessDictionary:dic];
    }
    
    return error;
}


- (void)requestFailed:(ASIHTTPRequest *)req {
    NSError *error = nil;
    
    NSError *asiError = [req error];
    // handle the http error
    if (asiError) {
        error = [HttpRequest adapterError:asiError];
    }
    
    // handle the oauth error
    int statusCode = [req responseStatusCode];
    if (statusCode >= 400 && statusCode <= 403) {
        NSString *response = [req responseString];
        NSDictionary *dic = [response JSONValue];
        if (dic) {
            NSInteger code = [[dic objectForKey:@"code"] integerValue];
            error = [NSError errorWithDomain:OAuthErrorDomain
                                        code:code
                                    userInfo:dic];
        }
    }
    
    if ([delegate_ respondsToSelector:@selector(OAuthClient:didFailWithError:)]) {
        [delegate_ OAuthClient:self didFailWithError:error];
    }
    
}


- (void)requestFinished:(ASIHTTPRequest *)req {
    NSError *error = nil;
    
    NSError *asiError = [req error];
    if (asiError) {
        error = [HttpRequest adapterError:asiError];
    }
    
    // handle the oauth error
    int statusCode = [req responseStatusCode];
    if (statusCode >= 400 && statusCode <= 403) {
        NSString *response = [req responseString];
        NSDictionary *dic = [response JSONValue];
        if (dic) {
            NSInteger code = [[dic objectForKey:@"code"] integerValue];
            error = [NSError errorWithDomain:OAuthErrorDomain
                                        code:code
                                    userInfo:dic];
        }
    }
    
    // Error
    if (error) {
        if ([delegate_ respondsToSelector:@selector(OAuthClient:didFailWithError:)]) {
            [delegate_ OAuthClient:self didFailWithError:error];
            return ;
        }
    }
    
    // Success
    NSString *response = [req responseString];
    NSDictionary *dic = [response JSONValue];
    OAuthStore *store = [OAuthStore sharedInstance];
    [store updateWithSuccessDictionary:dic];
    
    if ([delegate_ respondsToSelector:@selector(OAuthClient:didAcquireSuccessDictionary:)]) {
        [delegate_ OAuthClient:self didAcquireSuccessDictionary:dic];
    }
}



#if NS_BLOCKS_AVAILABLE

- (void)validateUsername:(NSString *)username
                password:(NSString *)password
                callback:(BasicBlock)block {
    ASIFormDataRequest *req = [self formRequest];
    
    [req setDelegate:self];
    
    [req setPostValue:@"password" forKey:kGrantTypeKey];
    [req setPostValue:username forKey:kUsernameKey];
    [req setPostValue:password forKey:kPasswordKey];
    [req setCompletionBlock:block];
    [req setFailedBlock:block];
    
    [req startAsynchronous];
}


- (void)validateAuthorizationCodeWithCallback:(BasicBlock)block {
    ASIFormDataRequest *req = [self formRequest];
    [req setDelegate:self];
    [req setPostValue:@"authorization_code" forKey:kGrantTypeKey];
    [req setPostValue:self.authorizationCode forKey:kOAuth2ResponseTypeCode];
    
    [req setCompletionBlock:block];
    [req setFailedBlock:block];
    
    [req startAsynchronous];
}


#endif



- (void)logout {
    OAuthStore *store = [OAuthStore sharedInstance];
    [store clear];
}

@end
