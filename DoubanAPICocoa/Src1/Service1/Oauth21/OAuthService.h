//
//  OAuthService.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-11-12.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Service.h"

@class OAuthService;
@protocol OAuthServiceDelegate <NSObject>

@required

- (void)OAuthClient:(OAuthService *)client didAcquireSuccessDictionary:(NSDictionary *)dic;

- (void)OAuthClient:(OAuthService *)client didFailWithError:(NSError *)error;

@end

@interface OAuthService : NSObject {
@private
@private
    NSString *clientId_;
    NSString *clientSecret_;
    NSString *authorizationCode_;
    NSString *authorizationURL_;
    NSString *callbackURL_;
    NSString *accessToken_;
    NSString *refreshToken_;
    
    id<OAuthServiceDelegate> delegate_;
}

@property (nonatomic, assign) id<OAuthServiceDelegate> delegate;
@property (nonatomic, retain) NSString *clientId;
@property (nonatomic, retain) NSString *clientSecret;
@property (nonatomic, retain) NSString *authorizationURL;
@property (nonatomic, retain) NSString *callbackURL;
@property (nonatomic, retain) NSString *authorizationCode;

@property (nonatomic, readonly) NSString *accessToken;
@property (nonatomic, readonly) NSString *refreshToken;

+ (id)sharedInstance;

- (void)validateAuthorizationCode;

- (void)validateUsername:(NSString *)username password:(NSString *)password;

- (NSError *)validateRefresh;

//#if NS_BLOCKS_AVAILABLE

//- (void)validateUsername:(NSString *)username
//                password:(NSString *)password
//                callback:(BasicBlock)block;

//- (void)validateAuthorizationCodeWithCallback:(BasicBlock)block;

//#endif

- (void)logout;

@end
