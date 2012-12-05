//
//  Service.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-11-12.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "Service.h"
#import "HttpRequest.h"
#import "Query.h"

#import "NSData+Base64.h"

#import "OAuthService.h"
#import "OAuthStore.h"
#import "Config.h"
//import DoubanDefines

#import "ASINetworkQueue.h"

@interface Service ()

@property (nonatomic, retain) ASINetworkQueue *queue;

- (void)addRequest:(HttpRequest *)request;
- (void)setMaxConcurrentOperationCount:(NSUInteger)maxConcurrentOperationCount;

@end

@implementation Service

NSUInteger const kDefaultMaxConcurrentOperationCount = 4;

@synthesize queue = queue_;

@synthesize apiBaseUrlString = apiBaseUrlString_;
@synthesize clientId = clientId_;
@synthesize clientSecret = clientSecret_;

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)dealloc {
    [queue_ release]; queue_ = nil;
    [apiBaseUrlString_ release]; apiBaseUrlString_ = nil;
    [clientId_ release]; clientId_ = nil;
    [clientSecret_ release]; clientSecret_ = nil;
    [super dealloc];
}


#pragma mark - Singleton

static Service *myInstance = nil;

+ (Service *)sharedInstance {
    
    @synchronized(self) {
        if (myInstance == nil) {
            myInstance = [[Service alloc] init];
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



- (NSError *)executeRefreshToken {
    OAuthService *service = [OAuthService sharedInstance];
    service.authorizationURL = kTokenUrl;
    service.clientId = self.clientId;
    service.clientSecret = self.clientSecret;
    return [service validateRefresh];
}



- (NSDictionary *)parseQueryString:(NSString *)query {
    NSMutableDictionary *dict = [[[NSMutableDictionary alloc] initWithCapacity:6] autorelease];
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    
    for (NSString *pair in pairs) {
        NSArray *elements = [pair componentsSeparatedByString:@"="];
        NSString *key =
        [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *val =
        [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        [dict setObject:val forKey:key];
    }
    return dict;
}


- (void)sign:(HttpRequest *)request {
    OAuthStore *store = [OAuthStore sharedInstance];
    if (store.accessToken && ![store hasExpired]) {
        NSString *authValue = [NSString stringWithFormat:@"%@ %@", @"Bearer", store.accessToken];
        //NSLog(@"bearer:%@", authValue);
        [request addRequestHeader:@"Authorization" value:authValue];
    }
    else {
        NSString *clientId = self.clientId;
        if (!clientId) {
            return ;
        }
        
        NSURL *url = [request url];
        NSString *urlString = [url absoluteString];
        NSString *query = [url query];
        if (query) {
            NSDictionary *parameters = [self parseQueryString:query];
            
            NSArray *keys = [parameters allKeys];
            if ([keys count] == 0) {
                urlString = [urlString stringByAppendingFormat:@"?%@=%@", @"apikey", clientId];
            }
            else {
                urlString = [urlString stringByAppendingFormat:@"&%@=%@", @"apikey", clientId];
            }
        }
        else {
            urlString = [urlString stringByAppendingFormat:@"?%@=%@", @"apikey", clientId];
        }
        
        NSString *afterUrl = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        request.url = [NSURL URLWithString:afterUrl];
    }
    
}


- (void)addRequest:(HttpRequest *)request {
    
    if (![self queue]) {
        [self setQueue:[[[ASINetworkQueue alloc] init] autorelease]];
        self.queue.maxConcurrentOperationCount = kDefaultMaxConcurrentOperationCount;
    }
    
    OAuthStore *store = [OAuthStore sharedInstance];
    if (store.userId != 0 && store.refreshToken && [store shouldRefreshToken]) {
        [self executeRefreshToken];
    }
    
    [self sign:request];
    
    [[self queue] addOperation:request];
    [[self queue] go];
}


- (void)setMaxConcurrentOperationCount:(NSUInteger)maxCount {
    self.queue.maxConcurrentOperationCount = maxCount;
}


- (BOOL)isValid {
    OAuthStore *store = [OAuthStore sharedInstance];
    if (store.accessToken) {
        return ![store hasExpired];
    }
    return NO;
}


#if NS_BLOCKS_AVAILABLE

- (HttpRequest *)get:(Query *)query callback:(ReqBlock)block {
    query.apiBaseUrlString = self.apiBaseUrlString;
    // __block, It tells the block not to retain the request, which is important in preventing a retain-cycle,
    // since the request will always retain the block
    __block HttpRequest * req = [HttpRequest requestWithQuery:query completionBlock:^{
        if (block != NULL) {
            block(req);
        }
    }];
    
    [req setRequestMethod:@"GET"];
    
    [self addRequest:req];
    return req;
}

- (HttpRequest *)post:(Query *)query postBody:(NSString *)body callback:(ReqBlock)block {
    query.apiBaseUrlString = self.apiBaseUrlString;
    __block HttpRequest * req = [HttpRequest requestWithQuery:query completionBlock:^{
        if (block != NULL) {
            block(req);
        }
    }];
    
    [req setRequestMethod:@"POST"];
    [req addRequestHeader:@"Content-Type" value:@"application/x-www-form-urlencoded; charset=UTF-8"];
    
    if (body && [body length] > 0) {
        NSData *objectData = [body dataUsingEncoding:NSUTF8StringEncoding];
        NSString *length = [NSString stringWithFormat:@"%lu", [objectData length]];
        [req appendPostData:objectData];
        [req addRequestHeader:@"Content-Length" value:length];
    }
    else {
        [req addRequestHeader:@"Content-Length" value:@"0"];
    }
    
    [req setResponseEncoding:NSUTF8StringEncoding];
    [self addRequest:req];
    return req;
}

- (HttpRequest *)post:(Query *)query
                photoData:(NSData *)photoData
              description:(NSString *)description
                 callback:(ReqBlock)block
   uploadProgressDelegate:(id<ASIProgressDelegate>)progressDelegate {
    
    query.apiBaseUrlString = self.apiBaseUrlString;
    __block HttpRequest * req = [HttpRequest requestWithQuery:query completionBlock:^{
        if (block != NULL) {
            block(req);
        }
    }];
    
    
    NSString *charset = (NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    
    // We don't bother to check if post data contains the boundary, since it's pretty unlikely that it does.
    CFUUIDRef uuid = CFUUIDCreate(nil);
    NSString *uuidString = [(NSString*)CFUUIDCreateString(nil, uuid) autorelease];
    CFRelease(uuid);
    NSString *stringBoundary = [NSString stringWithFormat:@"0xKhTmLbOuNdArY-%@",uuidString];
    NSString *endItemBoundary = [NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary];
    
    [req setRequestMethod:@"POST"];
    [req setResponseEncoding:NSUTF8StringEncoding];
    [req setUploadProgressDelegate:progressDelegate];
    
    [req addRequestHeader:@"Content-Type" value:[NSString stringWithFormat:@"multipart/form-data; charset=%@; boundary=%@", charset, stringBoundary]];
    
    [req appendPostString:[NSString stringWithFormat:@"--%@\r\n",stringBoundary]];
    
    // Adds post data
    [req appendPostString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", @"desc"]];
    [req appendPostString:description];
    [req appendPostString:endItemBoundary];
    
    // Adds Post file
    [req appendPostString:[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", @"image", @"image.jpeg"]];
    [req appendPostString:[NSString stringWithFormat:@"Content-Type: %@\r\n\r\n", @"image/jpeg"]];
    [req appendPostData:photoData];
    
    [req appendPostString:[NSString stringWithFormat:@"\r\n--%@--\r\n",stringBoundary]];
    
    // request length
    NSData *postData = [req postBody];
    [req addRequestHeader:@"Content-Length" value:[NSString stringWithFormat:@"%lu", [postData length]]];
    
    OAuthStore *store = [OAuthStore sharedInstance];
    if (store.userId != 0 && store.refreshToken && [store shouldRefreshToken]) {
        [self executeRefreshToken];
    }
    
    [self sign:req];
    [req startAsynchronous];
    return req;
}



- (HttpRequest *)delete:(Query *)query callback:(ReqBlock)block {
    
    query.apiBaseUrlString = self.apiBaseUrlString;
    
    __block HttpRequest * req = [HttpRequest requestWithQuery:query completionBlock:^{
        if (block != NULL) {
            block(req);
        }
    }];
    
    [req setRequestMethod:@"DELETE"];
    [req addRequestHeader:@"Content-Type" value:@"application/atom+xml"];
    [req addRequestHeader:@"Content-Length" value:@"0"];
    [self addRequest:req];
    return req;
}


#endif


- (HttpRequest *)get:(Query *)query delegate:(id<HttpRequestDelegate>)delegate {
    query.apiBaseUrlString = self.apiBaseUrlString;
    HttpRequest * req = [HttpRequest requestWithQuery:query target:delegate];
    
    [req setRequestMethod:@"GET"];
    [self addRequest:req];
    return req;
}


- (HttpRequest *)delete:(Query *)query delegate:(id<HttpRequestDelegate>)delegate {
    query.apiBaseUrlString = self.apiBaseUrlString;
    
    HttpRequest * req = [HttpRequest requestWithQuery:query target:delegate];
    [req setRequestMethod:@"DELETE"];
    [req addRequestHeader:@"Content-Type" value:@"application/atom+xml"];
    [req addRequestHeader:@"Content-Length" value:@"0"];
    [self addRequest:req];
    return req;
}

@end
