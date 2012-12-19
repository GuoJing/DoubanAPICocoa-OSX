//
//  DOUUserEngine.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-14.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUEngine.h"
#import "DOUUser.h"
#import "DOUBroadcastUser.h"
#import "DOUBroadcastUserArray.h"

@interface DOUUserEngine : DOUEngine

- (void)getUserWithRemoteID:(NSString *)user_id
               successBlock:(void(^)(DOUUser *))successBlock
                failedBlock:(void(^)(NSString *))failedBlock;

- (void)getUserFollowingWithUserID:(NSString *)user_id
                      successBlock:(void(^)(DOUBroadcastUserArray *))successBlock
                       failedBlock:(void(^)(NSString *))failedBlock;

- (void)getUserFollowersWithUserID:(NSString *)user_id
                      successBlock:(void(^)(DOUBroadcastUserArray *))successBlock
                       failedBlock:(void(^)(NSString *))failedBlock;

- (void)getUserFollowInCommonWithUserID:(NSString *)user_id
                      successBlock:(void(^)(DOUBroadcastUserArray *))successBlock
                       failedBlock:(void(^)(NSString *))failedBlock;

- (void)searchUser:(NSString *)text
                      successBlock:(void(^)(DOUBroadcastUserArray *))successBlock
                       failedBlock:(void(^)(NSString *))failedBlock;

- (void)followSomeOneWithUserID:(NSString *)user_id
               successBlock:(void(^)(NSString *))successBlock
                failedBlock:(void(^)(NSString *))failedBlock;

- (void)unfollowSomeOneWithUserID:(NSString *)user_id
                 successBlock:(void(^)(NSString *))successBlock
                  failedBlock:(void(^)(NSString *))failedBlock;

- (void)blockSomeOneWithUserID:(NSString *)user_id
              successBlock:(void(^)(NSString *))successBlock
               failedBlock:(void(^)(NSString *))failedBlock;

- (void)getRelationShopWithSourceID:(NSString *)source_id
                           targetID:(NSString *)target_id
                       successBlock:(void(^)(NSString *))successBlock
                        failedBlock:(void(^)(NSString *))failedBlock;

@end
