//
//  DOUBookEngine.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-16.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUBookEngine.h"

#import "DOUBook.h"
#import "DOUBookArray.h"

#import "DOUAPIConsts.h"
#import "DOUErrorConsts.h"

#import "DOUBook.h"

@implementation DOUBookEngine

- (void)getBookWithRemoteID:(NSString *)book_id
               successBlock:(void(^)(DOUBook *))successBlock
                failedBlock:(void(^)(NSString *))failedBlock{
    __block DOUBook *newBook = nil;
    if(![self isServiceValid]) {
        if (failedBlock) {
            failedBlock(kDOUErrorServiceError);
        }
        return;
    }
    
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookAPIUrl, book_id];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        NSLog(@"%@", [req url]);
        if (!error) {
            DOUBookArray *array = [[DOUBookArray alloc] initWithString:[req responseString]];
            if (array) {
                newBook = [[DOUBook alloc] initWithString:[req responseString]];
                if (successBlock) {
                    successBlock(newBook);
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


- (void)getBookWithRemoteISBN:(NSString *)isbn
                 successBlock:(void(^)(DOUBook *))successBlock
                  failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)searchBooks:(NSString *)search_text
              start:(int)start
              count:(int)count
       successBlock:(void(^)(DOUBookArray *))successBlock
        failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)getTagsWithRemoteBookID:(NSString *)book_id
                   successBlock:(void(^)(DOUTagArray *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)getTagsWithRemoteUserID:(NSString *)user_id
                         bookID:(NSString *)book_id
                   successBlock:(void(^)(DOUUserTagArray *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)getBookCollectionsWithRemoteUserID:(NSString *)user_id
                                     start:(int)start
                                     count:(int)count
                              successBlock:(void(^)(DOUCollectionArray *))successBlock
                               failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)getUserCollectionWithRemoteBookID:(NSString *)book_id
                                    start:(int)start
                                    count:(int)count
                             successBlock:(void(^)(DOUCollection *))successBlock
                              failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)getAnnotationsWithRemoteUserID:(NSString *)user_id
                                 start:(int)start
                                 count:(int)count
                          successBlock:(void(^)(DOUCollectionArray *))successBlock
                           failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)getAnnotationsWithRemoteBookID:(NSString *)book_id
                                 start:(int)start
                                 count:(int)count
                          successBlock:(void(^)(DOUCollectionArray *))successBlock
                           failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)getAnnotationWithRemoteID:(NSString *)annotation_id
                     successBlock:(void(^)(DOUAnnotation *))successBlock
                      failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)collectBookWithRemoteID:(NSString *)book_id
                         status:(NSString *)status
                           tags:(NSString *)tags
                        comment:(NSString *)comment
                        privacy:(NSString *)privacy
                         rating:(NSString *)rating
                   successBlock:(void(^)(NSString *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)editBookCollectWithRemoteID:(NSString *)book_id
                             status:(NSString *)status
                               tags:(NSString *)tags
                            comment:(NSString *)comment
                            privacy:(NSString *)privacy
                             rating:(NSString *)rating
                       successBlock:(void(^)(NSString *))successBlock
                        failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)deleteBookCollectWithRemoteID:(NSString *)book_id
                         successBlock:(void(^)(NSString *))successBlock
                          failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)writeAnnotation:(NSString *)book_id
             withContet:(NSString *)content
               withPage:(NSString *)page
            withChapter:(NSString *)chapter
            withPrivacy:(NSString *)privacy
           successBlock:(void(^)(NSString *))successBlock
            failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)editAnnotation:(NSString *)book_id
            withContet:(NSString *)content
              withPage:(NSString *)page
           withChapter:(NSString *)chapter
           withPrivacy:(NSString *)privacy
          successBlock:(void(^)(NSString *))successBlock
           failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)deleteAnnotation:(NSString *)annotation_id
            successBlock:(void(^)(NSString *))successBlock
             failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)writeReview:(NSString *)book_id
              title:(NSString *)title
            content:(NSString *)content
             rating:(NSString *)rating
       successBlock:(void(^)(NSString *))successBlock
        failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)eidtReview:(NSString *)book_id
             title:(NSString *)title
           content:(NSString *)content
            rating:(NSString *)rating
      successBlock:(void(^)(NSString *))successBlock
       failedBlock:(void(^)(NSString *))failedBlock{
}

- (void)deleteReview:(NSString *)book_id
        successBlock:(void(^)(NSString *))successBlock
         failedBlock:(void(^)(NSString *))failedBlock{
}

@end