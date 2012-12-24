//
//  DOUEngine.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-13.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUService.h"
#import "DOUOAuthService.h"
#import "DOUAPIConfig.h"
#import "DOUQuery.h"
#import "DOUHttpRequest.h"
#import "DOUOAuthStore.h"
#import "DOUConsts.h"
#import "DOUUser.h"

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
- (id)getEngine:(EngineTypes)engine_id;
- (void)checkServiceFailedWhen:(void(^)(NSString *))failedBlock;
- (void)getWhoAmI:(void(^)(DOUUser *))successBlock
      failedBlock:(void(^)(NSString *))failedBlock;
@end
