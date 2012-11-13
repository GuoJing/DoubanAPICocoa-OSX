//
//  Query.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-11-12.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "Query.h"

@implementation Query

@synthesize subPath = subPath_;
@synthesize parameters = parameters_;
@synthesize apiBaseUrlString = apiBaseUrlString_;

- (id)initWithSubPath:(NSString *)aSubPath parameters:(NSDictionary *)theParameters {
    self = [super init];
    if (self) {
        subPath_ = [aSubPath retain];
        parameters_ = [theParameters retain];
    }
    return self;
}


- (void)dealloc {
    [subPath_ release]; subPath_ = nil;
    [parameters_ release]; parameters_ = nil;
    [apiBaseUrlString_ release]; apiBaseUrlString_ = nil;
    [super dealloc];
}


- (NSString *)parametersUrlString {
    NSString *parametersUrl = @"";
    NSUInteger index = 0;
    for (id key in [parameters_ allKeys]) {
        NSString* value = [parameters_ objectForKey:key];
        if (index == 0) {
            parametersUrl = [parametersUrl stringByAppendingFormat:@"?%@=%@", key, value];
        }
        else {
            parametersUrl = [parametersUrl stringByAppendingFormat:@"&%@=%@", key, value];
        }
        ++index;
    }
    return parametersUrl;
}


- (NSString *)requestURLString {
    NSString *url = [NSString stringWithFormat:@"%@%@", apiBaseUrlString_, subPath_];
    NSString *parameterStr = [self parametersUrlString];
    if ( parameterStr != nil && [parameterStr length] > 0 ) {
        url = [url stringByAppendingString:parameterStr];
    }
    
    return [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


- (NSURL *)requestURL {
    return [NSURL URLWithString:[self requestURLString]];
}

@end
