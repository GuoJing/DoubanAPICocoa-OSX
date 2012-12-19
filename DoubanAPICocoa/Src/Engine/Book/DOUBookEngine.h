//
//  DOUBookEngine.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-16.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DOUEngine.h"

#import "DOUBook.h"
#import "DOUBookArray.h"
#import "DOUTagArray.h"
#import "DOUUserTagArray.h"
#import "DOUCollection.h"
#import "DOUCollectionArray.h"
#import "DOUAnnotation.h"
#import "DOUAnnotationArray.h"

@interface DOUBookEngine : DOUEngine

- (void)getBookWithRemoteID:(NSString *)book_id
                successBlock:(void(^)(DOUBook *))successBlock
                 failedBlock:(void(^)(NSString *))failedBlock;


- (void)getBookWithRemoteISBN:(NSString *)isbn
               successBlock:(void(^)(DOUBook *))successBlock
                failedBlock:(void(^)(NSString *))failedBlock;

- (void)searchBooks:(NSString *)search_text
              start:(int)start
              count:(int)count
       successBlock:(void(^)(DOUBookArray *))successBlock
        failedBlock:(void(^)(NSString *))failedBlock;

- (void)getTagsWithRemoteBookID:(NSString *)book_id
                 successBlock:(void(^)(DOUTagArray *))successBlock
                  failedBlock:(void(^)(NSString *))failedBlock;

- (void)getTagsWithRemoteUserID:(NSString *)user_id
                          start:(int)start
                          count:(int)count
           successBlock:(void(^)(DOUUserTagArray *))successBlock
            failedBlock:(void(^)(NSString *))failedBlock;

- (void)getBookCollectionsWithRemoteUserID:(NSString *)user_id
                                     start:(int)start
                                     count:(int)count
                  successBlock:(void(^)(DOUCollectionArray *))successBlock
                   failedBlock:(void(^)(NSString *))failedBlock;

- (void)getUserCollectionWithRemoteBookID:(NSString *)book_id
                       successBlock:(void(^)(DOUCollection *))successBlock
                        failedBlock:(void(^)(NSString *))failedBlock;

- (void)getAnnotationsWithRemoteUserID:(NSString *)user_id
                                 start:(int)start
                                 count:(int)count
                              successBlock:(void(^)(DOUCollectionArray *))successBlock
                               failedBlock:(void(^)(NSString *))failedBlock;

- (void)getAnnotationsWithRemoteBookID:(NSString *)book_id
                                 start:(int)start
                                 count:(int)count
                              successBlock:(void(^)(DOUCollectionArray *))successBlock
                               failedBlock:(void(^)(NSString *))failedBlock;

- (void)getAnnotationWithRemoteID:(NSString *)annotation_id
                     successBlock:(void(^)(DOUAnnotation *))successBlock
                      failedBlock:(void(^)(NSString *))failedBlock;

- (void)collectBookWithRemoteID:(NSString *)book_id
                         status:(NSString *)status
                           tags:(NSString *)tags
                        comment:(NSString *)comment
                        privacy:(NSString *)privacy
                         rating:(int)rating
                   successBlock:(void(^)(NSString *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock;

- (void)deleteBookCollectWithRemoteID:(NSString *)book_id
                   successBlock:(void(^)(NSString *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock;

- (void)writeAnnotationWithBookID:(NSString *)book_id
             withContet:(NSString *)content
               withPage:(NSString *)page
            withChapter:(NSString *)chapter
            withPrivacy:(NSString *)privacy
           successBlock:(void(^)(NSString *))successBlock
            failedBlock:(void(^)(NSString *))failedBlock;

- (void)editAnnotation:(NSString *)annotation_id
             withContet:(NSString *)content
               withPage:(NSString *)page
            withChapter:(NSString *)chapter
            withPrivacy:(NSString *)privacy
           successBlock:(void(^)(NSString *))successBlock
            failedBlock:(void(^)(NSString *))failedBlock;

- (void)deleteAnnotation:(NSString *)annotation_id
                         successBlock:(void(^)(NSString *))successBlock
                          failedBlock:(void(^)(NSString *))failedBlock;

- (void)writeReviewWithBookID:(NSString *)book_id
              title:(NSString *)title
            content:(NSString *)content
             rating:(int)rating
       successBlock:(void(^)(NSString *))successBlock
        failedBlock:(void(^)(NSString *))failedBlock;

- (void)editReview:(NSString *)review_id
              title:(NSString *)title
            content:(NSString *)content
             rating:(int)rating
      successBlock:(void(^)(NSString *))successBlock
       failedBlock:(void(^)(NSString *))failedBlock;

- (void)deleteReview:(NSString *)review_id
        successBlock:(void(^)(NSString *))successBlock
         failedBlock:(void(^)(NSString *))failedBlock;

@end

