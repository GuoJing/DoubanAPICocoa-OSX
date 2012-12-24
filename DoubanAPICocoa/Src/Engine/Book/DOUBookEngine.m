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
    [self checkServiceFailedWhen:failedBlock];
    
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookAPIUrl, book_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUBookArray *array = [[[DOUBookArray alloc] initWithString:[req responseString]] autorelease];
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
    __block DOUBook *newBook = nil;
    [self checkServiceFailedWhen:failedBlock];
    
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookWithISBNAPIUrl, isbn];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUBookArray *array = [[[DOUBookArray alloc] initWithString:[req responseString]] autorelease];
            if (array) {
                newBook = [[[DOUBook alloc] initWithString:[req responseString]] autorelease];
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

- (void)searchBooks:(NSString *)search_text
              start:(int)start
              count:(int)count
       successBlock:(void(^)(DOUBookArray *))successBlock
        failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookSearchAPIUrl, search_text, start, count];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUBookArray *array = [[[DOUBookArray alloc] initWithString:[req responseString]] autorelease];
            if (successBlock) {
                successBlock(array);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

- (void)getTagsWithRemoteBookID:(NSString *)book_id
                   successBlock:(void(^)(DOUTagArray *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookTagsAPIUrl, book_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUTagArray *array = [[[DOUTagArray alloc] initWithString:[req responseString]] autorelease];
            if (successBlock) {
                successBlock(array);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

- (void)getTagsWithRemoteUserID:(NSString *)user_id
                          start:(int)start
                          count:(int)count
                   successBlock:(void(^)(DOUUserTagArray *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookUserAllTagsAPIUrl, user_id, start, count];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUUserTagArray *array = [[[DOUUserTagArray alloc] initWithString:[req responseString]] autorelease];
            if (successBlock) {
                successBlock(array);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

- (void)getBookCollectionsWithRemoteUserID:(NSString *)user_id
                                     start:(int)start
                                     count:(int)count
                              successBlock:(void(^)(DOUCollectionArray *))successBlock
                               failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookUserAllCollectionsAPIUrl, user_id, start, count];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUCollectionArray *array = [[[DOUCollectionArray alloc] initWithString:[req responseString]] autorelease];
            if (successBlock) {
                successBlock(array);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

- (void)getUserCollectionWithRemoteBookID:(NSString *)book_id
                             successBlock:(void(^)(DOUCollection *))successBlock
                              failedBlock:(void(^)(NSString *))failedBlock{
    __block DOUCollection *newCollection = nil;
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookCollectInfoAPIUrl, book_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUCollectionArray *array = [[[DOUCollectionArray alloc] initWithString:[req responseString]] autorelease];
            if (array) {
                newCollection = [[[DOUCollection alloc] initWithString:[req responseString]] autorelease];
                if (successBlock) {
                    successBlock(newCollection);
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

- (void)getAnnotationsWithRemoteUserID:(NSString *)user_id
                                 start:(int)start
                                 count:(int)count
                          successBlock:(void(^)(DOUCollectionArray *))successBlock
                           failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookUserAnnotationAPIUrl, user_id, start, count];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUCollectionArray *array = [[[DOUCollectionArray alloc] initWithString:[req responseString]] autorelease];
            if (successBlock) {
                successBlock(array);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

- (void)getAnnotationsWithRemoteBookID:(NSString *)book_id
                                 start:(int)start
                                 count:(int)count
                          successBlock:(void(^)(DOUCollectionArray *))successBlock
                           failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookAnnotationsAPIUrl, book_id, start, count];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUCollectionArray *array = [[[DOUCollectionArray alloc] initWithString:[req responseString]] autorelease];
            if (successBlock) {
                successBlock(array);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service get:query callback:completionBlock];
}

- (void)getAnnotationWithRemoteID:(NSString *)annotation_id
                     successBlock:(void(^)(DOUAnnotation *))successBlock
                      failedBlock:(void(^)(NSString *))failedBlock{
    __block DOUAnnotation *newAnnotation = nil;
    [self checkServiceFailedWhen:failedBlock];
    
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookAnnotationAPIUrl, annotation_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUAnnotation *array = [[[DOUAnnotation alloc] initWithString:[req responseString]] autorelease];
            if (array) {
                newAnnotation = [[[DOUAnnotation alloc] initWithString:[req responseString]] autorelease];
                if (successBlock) {
                    successBlock(newAnnotation);
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

- (void)collectBookWithRemoteID:(NSString *)book_id
                         status:(NSString *)status
                           tags:(NSString *)tags
                        comment:(NSString *)comment
                        privacy:(NSString *)privacy
                         rating:(int)rating
                   successBlock:(void(^)(NSString *))successBlock
                    failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookCollectBookAPIUrl, book_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    NSMutableString *postBody = [NSMutableString stringWithFormat:@"status=%@&tags=%@&comment=%@&privacy=%@&rating=%d", status, tags, comment, privacy, rating];
    DOUReqBlock completionPutBlock = ^(DOUHttpRequest * req) {
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(kDOUErrorOK);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    DOUReqBlock completionBlock = ^(DOUHttpRequest * req) {
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(kDOUErrorOK);
            }
        } else {
            [service put:query putBody:postBody callback:completionPutBlock];
        }
    };
    [service post:query postBody:postBody callback:completionBlock];
}

- (void)deleteBookCollectWithRemoteID:(NSString *)book_id
                         successBlock:(void(^)(NSString *))successBlock
                          failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookCollectBookAPIUrl, book_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest * req) {
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(kDOUErrorOK);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service delete:query callback:completionBlock];
}

- (void)writeAnnotationWithBookID:(NSString *)book_id
             withContet:(NSString *)content
               withPage:(NSString *)page
            withChapter:(NSString *)chapter
            withPrivacy:(NSString *)privacy
           successBlock:(void(^)(NSString *))successBlock
            failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    NSMutableString *postBody = nil;
    postBody = [NSMutableString stringWithFormat:@"content=%@&page=%@&chapter=%@", content, page, chapter];
    if ([privacy isEqualToString:kDOUPrivacyPrivate]) {
        postBody = [NSMutableString stringWithFormat:@"content=%@&page=%@&chapter=%@&privacy=%@", content, page, chapter, privacy];
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookWriteAnnotationAPIUrl, book_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest * req) {
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(kDOUErrorOK);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service post:query postBody:postBody callback:completionBlock];
}

- (void)editAnnotation:(NSString *)annotation_id
            withContet:(NSString *)content
              withPage:(NSString *)page
           withChapter:(NSString *)chapter
           withPrivacy:(NSString *)privacy
          successBlock:(void(^)(NSString *))successBlock
           failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    NSMutableString *putBody = nil;
    putBody = [NSMutableString stringWithFormat:@"content=%@&page=%@&chapter=%@", content, page, chapter];
    if ([privacy isEqualToString:kDOUPrivacyPrivate]) {
        putBody = [NSMutableString stringWithFormat:@"content=%@&page=%@&chapter=%@&privacy=%@", content, page, chapter, privacy];
    }
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookEditAnnotationAPIUrl, annotation_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest * req) {
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(kDOUErrorOK);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service put:query putBody:putBody callback:completionBlock];
}

- (void)deleteAnnotation:(NSString *)annotation_id
            successBlock:(void(^)(NSString *))successBlock
             failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookEditAnnotationAPIUrl, annotation_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest * req) {
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(kDOUErrorOK);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service delete:query callback:completionBlock];
}

- (void)writeReviewWithBookID:(NSString *)book_id
              title:(NSString *)title
            content:(NSString *)content
             rating:(int)rating
       successBlock:(void(^)(NSString *))successBlock
        failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    NSMutableString *postBody = [NSMutableString stringWithFormat:@"book=%@&title=%@&content=%@&rating=%d", book_id , title, content, rating];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookWriteReviewAPIUrl, book_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest * req) {
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(kDOUErrorOK);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service post:query postBody:postBody callback:completionBlock];
}

- (void)editReview:(NSString *)review_id
             title:(NSString *)title
           content:(NSString *)content
            rating:(int)rating
      successBlock:(void(^)(NSString *))successBlock
       failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    NSMutableString *putBody = [NSMutableString stringWithFormat:@"&title=%@&content=%@&rating=%d", title, content, rating];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookEditReviewAPIUrl, review_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest * req) {
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(kDOUErrorOK);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service put:query putBody:putBody callback:completionBlock];
}

- (void)deleteReview:(NSString *)review_id
        successBlock:(void(^)(NSString *))successBlock
         failedBlock:(void(^)(NSString *))failedBlock{
    [self checkServiceFailedWhen:failedBlock];
    DOUService *service = [self getService];
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    NSString *apiUrl = [NSString stringWithFormat:kDOUBookEditReviewAPIUrl, review_id];
    DOUQuery *query = [[[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil] autorelease];
    DOUReqBlock completionBlock = ^(DOUHttpRequest * req) {
        NSError *error = [req doubanError];
        if (!error) {
            if (successBlock) {
                successBlock(kDOUErrorOK);
            }
        } else {
            if (failedBlock) {
                failedBlock([req responseString]);
            }
        }
    };
    [service delete:query callback:completionBlock];
}

@end
