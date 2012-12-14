//
//  DOUEngine.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-13.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUService.h"

@interface DOUEngine : NSObject {
    NSString *apiKey;
    NSString *secretKey;
    NSString *redirUrl;
}

@property (nonatomic, copy) NSString *apiKey;
@property (nonatomic, copy) NSString *secretKey;
@property (nonatomic, copy) NSString *redirUrl;

- (id)initWithEngine:(DOUEngine *)engine;
- (id)initWithApiKey:(NSString *)theApiKey
       withSecretKey:(NSString *)theSecretKey
        withRedirUrl:(NSString *)theRedirUrl;
- (NSString *)getConnectUrl;
- (void)didLoadWithCode:(NSString *)code;
- (BOOL)isServiceValid;
- (DOUService *)getService;
- (id)getEngine:(NSString *)engine;

@end
