//
//  DOUMailEngine.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUEngine.h"
#import "DOUMail.h"
#import "DOUMailArray.h"

@interface DOUMailEngine : DOUEngine

- (void)getDoumailWithRemoteID:(NSString *)book_id
               successBlock:(void(^)(DOUMail *))successBlock
                failedBlock:(void(^)(NSString *))failedBlock;

- (void)getInbox:(void(^)(DOUMailArray *))successBlock
                   failedBlock:(void(^)(NSString *))failedBlock;

- (void)getOutbox:(void(^)(DOUMailArray *))successBlock
     failedBlock:(void(^)(NSString *))failedBlock;

- (void)getInboxUnread:(void(^)(DOUMailArray *))successBlock
     failedBlock:(void(^)(NSString *))failedBlock;

- (void)markAsReadWithID:(NSString *)doumail_id
            successBlock:(void(^)(NSString *))successBlock
             failedBlock:(void(^)(NSString *))failedBlock;

- (void)markMultipleAsReadWithIDS:(NSString *)doumail_ids
            successBlock:(void(^)(NSString *))successBlock
             failedBlock:(void(^)(NSString *))failedBlock;

- (void)deleteDoumailWithID:(NSString *)doumail_id
            successBlock:(void(^)(NSString *))successBlock
             failedBlock:(void(^)(NSString *))failedBlock;

- (void)deleteMultipleDoumailWithIDS:(NSString *)doumail_ids
                    successBlock:(void(^)(NSString *))successBlock
                     failedBlock:(void(^)(NSString *))failedBlock;

- (void)sendDoumailWithTitle:(NSString *)title
                     withContent:(NSString *)content
                 withReceiverID:(NSString *)receiver_id
               withCaptchaToken:(NSString *)captcha_token
              withCaptchaString:(NSString *)captcha_string
                successBlock:(void(^)(NSString *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock;

@end
