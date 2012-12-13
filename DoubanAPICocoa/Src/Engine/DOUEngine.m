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

@implementation DOUEngine

@synthesize apiKey;
@synthesize secretKey;
@synthesize redirUrl;

- (id)initWithApiKey:(NSString *)theApiKey
       withSecretKey:(NSString *)theSecretKey
        withRedirUrl:(NSString *)theRedirUrl {
    //Use this to new a engine
    self.apiKey = theApiKey;
    self.secretKey = theSecretKey;
    self.redirUrl = theRedirUrl;
    return self;
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
