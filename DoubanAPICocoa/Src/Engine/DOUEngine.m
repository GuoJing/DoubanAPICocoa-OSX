//
//  DOUEngine.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-13.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUEngine.h"
#import "DOUService.h"
#import "DOUAPIConfig.h"
#import "DOUOAuthService.h"

#import "DOUEventEngine.h"

@implementation DOUEngine

@synthesize apiKey;
@synthesize secretKey;
@synthesize redirUrl;

- (id)initWithEngine:(DOUEngine *)engine {
    self = [super init];
    if (self) {
        self.apiKey = engine.apiKey;
        self.secretKey = engine.secretKey;
        self.redirUrl = engine.redirUrl;
    }
    return self;
}

- (id)initWithApiKey:(NSString *)theApiKey
       withSecretKey:(NSString *)theSecretKey
        withRedirUrl:(NSString *)theRedirUrl {
    self = [super init];
    if (self) {
        //Use this to new a engine
        self.apiKey = theApiKey;
        self.secretKey = theSecretKey;
        self.redirUrl = theRedirUrl;
    }
    return self;
}

- (NSString *)getConnectUrl {
    NSString *urlStr = [NSString stringWithFormat:@"https://www.douban.com/service/auth2/auth?client_id=%@&redirect_uri=%@&response_type=code", self.apiKey, self.redirUrl];
    return urlStr;
}

- (void)didLoadWithCode:(NSString *)code{
    DOUOAuthService *service = [DOUOAuthService sharedInstance];
    service.authorizationURL = kTokenUrl;
    service.delegate = (id)self;
    service.clientId = self.apiKey;
    service.clientSecret = self.secretKey;
    service.callbackURL = self.redirUrl;
    service.authorizationCode = code;
    
    [service validateAuthorizationCode];
}

- (BOOL)isServiceValid{
    DOUService *service = [DOUService sharedInstance];
    if ([service isValid]) {
        return YES;
    } else {
        return NO;
    }
}

- (DOUService *)getService{
    DOUService *service = [DOUService sharedInstance];
    if (![self isServiceValid]) {
        return nil;
    } else {
        return service;
    }
}

- (id)getEngine:(NSString *)engine{
    if ([engine isEqualToString:@"event"]) {
        return [[DOUEventEngine alloc] initWithEngine:self];
    }
    return self;
}

- (void)dealloc {
    [[self apiKey] release];
    [[self secretKey] release];
    [[self redirUrl] release];
    self.apiKey = nil;
    self.secretKey = nil;
    self.redirUrl = nil;
    [super dealloc];
}

@end
