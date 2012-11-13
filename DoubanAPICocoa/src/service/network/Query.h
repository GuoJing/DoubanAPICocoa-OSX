//
//  Query.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-11-12.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Query : NSObject {
    @private
    NSString *subPath_;
    NSDictionary *parameters_;
    NSString *apiBaseUrlString_;
}

@property (nonatomic, copy) NSString *subPath;
@property (nonatomic, retain) NSDictionary *parameters;
@property (nonatomic, copy) NSString *apiBaseUrlString;

- (id)initWithSubPath:(NSString *)aSubPath parameters:(NSDictionary *)theParameters;

- (NSString *)requestURLString;

- (NSURL *)requestURL;

@end
