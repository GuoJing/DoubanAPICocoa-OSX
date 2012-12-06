//
//  OAuthStore.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-11-12.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAuthStore : NSObject {
    @private
    NSString *accessToken_;
    NSString *refreshToken_;
    NSDate *expiresIn_;
    int userId_;
}

@property (nonatomic, copy, readonly) NSString *accessToken;
@property (nonatomic, copy, readonly) NSString *refreshToken;
@property (nonatomic, copy, readonly) NSDate *expiresIn;

@property (nonatomic, assign, readonly) int userId;

+ (id)sharedInstance;

- (void)updateWithSuccessDictionary:(NSDictionary *)dic;

- (BOOL)hasExpired;

// refresh token one day before token is expired.
- (BOOL)shouldRefreshToken;

- (void)save;

- (void)clear;

@end
