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
#import "DOULocEngine.h"
#import "DOUAlbumEngine.h"
#import "DOUPhotoEngine.h"
#import "DOUCommentEngine.h"
#import "DOUOnlineEngine.h"
#import "DOUUserEngine.h"
#import "DOUBookEngine.h"
#import "DOUMovieEngine.h"
#import "DOUMusicEngine.h"
#import "DOUMailEngine.h"
#import "DOUNoteEngine.h"
#import "DOUDiscussionEngine.h"
#import "DOUBroadcastEngine.h"
#import "DOUErrorConsts.h"
#import "DOUAPIConsts.h"
#import "DOUConsts.h"

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
    NSString *urlStr = [NSString stringWithFormat:@"%@/service/auth2/auth?client_id=%@&redirect_uri=%@&response_type=code", kDoubanHttpsUrl, self.apiKey, self.redirUrl];
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

- (id)getEngine:(EngineTypes)engine_id{
    switch (engine_id) {
        case kDOUEvent:
            return [[[DOUEventEngine alloc] initWithEngine:self] autorelease];
        case kDOULoc:
            return[[[DOULocEngine alloc] initWithEngine:self] autorelease];;
        case kDOUAlbum:
            return [[[DOUAlbumEngine alloc] initWithEngine:self] autorelease];;
        case kDOUPhoto:
            return [[[DOUPhotoEngine alloc] initWithEngine:self] autorelease];
        case kDOUComment:
            return [[[DOUCommentEngine alloc] initWithEngine:self] autorelease];
        case kDOUOnline:
            return [[[DOUOnlineEngine alloc] initWithEngine:self] autorelease];
        case kDOUUser:
            return [[[DOUUserEngine alloc] initWithEngine:self] autorelease];
        case kDOUBook:
            return [[[DOUBookEngine alloc] initWithEngine:self] autorelease];
        case kDOUMovie:
            return [[[DOUMovieEngine alloc] initWithEngine:self] autorelease];
        case kDOUMusic:
            return [[[DOUMusicEngine alloc] initWithEngine:self] autorelease];
        case kDOUBroadcast:
            return [[[DOUBroadcastEngine alloc] initWithEngine:self] autorelease];
        case kDOUMail:
            return [[[DOUMailEngine alloc] initWithEngine:self] autorelease];
        case kDOUNote:
            return [[[DOUNoteEngine alloc] initWithEngine:self] autorelease];
        case kDOUDiscussion:
            return [[[DOUDiscussionEngine alloc] initWithEngine:self] autorelease];
        default:
            return self;
    }
    return self;
}

- (void)checkServiceFailedWhen:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
}

- (void)getWhoAmI:(void(^)(DOUUser *))successBlock
      failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = kDOUUserMeAPIUrl;
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUUser *user = [[[DOUUser alloc] initWithString:[req responseString]] autorelease];
            if (user) {
                if (successBlock) {
                    successBlock(user);
                }
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

- (void)dealloc {
    self.apiKey = nil;
    self.secretKey = nil;
    self.redirUrl = nil;
    [super dealloc];
}

@end
