//
//  DOUNoteEngine.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-20.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUNoteEngine.h"
#import "DOUErrorConsts.h"
#import "DOUAPIConsts.h"

@implementation DOUNoteEngine

- (void)writeNoteWithTitle:(NSString *)title
               withPrivacy:(NSString *)privacy
              withCanReply:(NSString *)can_reply
               withContent:(NSString *)content
              successBlock:(void(^)(NSString *))successBlock
               failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = kDOUNoteWriteNoteAPIUrl;
    NSMutableString *postBody = [NSMutableString stringWithFormat:@"title=%@&privacy=%@&can_reply=%@&content=%@", title, privacy, can_reply, content];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(@"success");
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service post:query postBody:postBody callback:completionBlock];
}

- (void)getNoteWithRemoteID:(NSString *)note_id
               successBlock:(void(^)(DOUNote *))successBlock
                failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUNoteAPIUrl, note_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUNote *note = [[[DOUNote alloc] initWithString:[req responseString]] autorelease];
            if (note) {
                if (successBlock) {
                    successBlock(note);
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

- (void)editNoteWithRemoteID:(NSString *)note_id
                     withTitle:(NSString *)title
                   withPrivacy:(NSString *)privacy
                  withCanReply:(NSString *)can_reply
                   withContent:(NSString *)content
                  successBlock:(void(^)(NSString *))successBlock
                   failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUNoteAPIUrl, note_id] autorelease];
    NSMutableString *putBody = [NSMutableString stringWithFormat:@"title=%@&privacy=%@&can_reply=%@&content=%@", title, privacy, can_reply, content];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(@"success");
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service put:query putBody:putBody callback:completionBlock];
}

- (void)deleteNoteWithRemoteID:(NSString *)note_id
                  successBlock:(void(^)(NSString *))successBlock
                   failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUNoteAPIUrl, note_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(@"success");
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service delete:query callback:completionBlock];
}

- (void)uploadPhotoWithNoteID:(NSString *)note_id
                  withContent:(NSString *)content
                      withPid:(NSString *)pid
                withLayoutPid:(NSString *)layout_pid
                  withDescPid:(NSString *)desc_pid
                 withImagePid:(NSString *)image_pid
                withImageData:(NSData *)image_data
                 successBlock:(void(^)(NSString *))successBlock
                  failedBlock:(void(^)(NSString *))failedBlock{
    //TODO可能还有一些问题
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUNoteAPIUrl, note_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(@"success");
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    NSString *image_name = [[[NSString alloc] initWithFormat:@"image_%@", image_pid] autorelease];
    [service post2:query photoData:image_data description:pid descriptionName:image_name callback:completionBlock uploadProgressDelegate:nil];
}

- (void)getNoteCommentsWithNoteID:(NSString *)note_id
                     successBlock:(void(^)(DOUCommentArray *))successBlock
                      failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUNoteCommentsAPIUrl, note_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUCommentArray *array = [[[DOUCommentArray alloc] initWithString:[req responseString]] autorelease];
            if (array) {
                if (successBlock) {
                    successBlock(array);
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

- (void)likeNoteWithNoteID:(NSString *)note_id
              successBlock:(void(^)(NSString *))successBlock
               failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUNoteLikeAPIUrl, note_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        NSLog(@"%@", [req url]);
        if (!error) {
            if (successBlock) {
                successBlock(@"success");
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service post:query postBody:@"" callback:completionBlock];
}

- (void)unLikeNoteWithNoteID:(NSString *)note_id
                successBlock:(void(^)(NSString *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUNoteLikeAPIUrl, note_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(@"success");
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service delete:query callback:completionBlock];
    
}

- (void)getNotesWithUserID:(NSString *)user_id
              successBlock:(void(^)(DOUNoteArray *))successBlock
               failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUNoteUserNotesAPIUrl, user_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUNoteArray *array = [[[DOUNoteArray alloc] initWithString:[req responseString]] autorelease];
            if (array) {
                if (successBlock) {
                    successBlock(array);
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

- (void)getUserLikedNotesWithUserID:(NSString *)user_id
                       successBlock:(void(^)(DOUNoteArray *))successBlock
                        failedBlock:(void(^)(NSString *))failedBlock{
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [[[NSString alloc] initWithFormat:kDOUNoteUserLikedNotesAPIUrl, user_id] autorelease];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUNoteArray *array = [[[DOUNoteArray alloc] initWithString:[req responseString]] autorelease];
            if (array) {
                if (successBlock) {
                    successBlock(array);
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

@end
