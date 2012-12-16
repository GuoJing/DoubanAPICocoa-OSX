//
//  DOUCollection.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-16.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUCollection.h"

@implementation DOUCollection

@dynamic status;
@dynamic book_id;
@dynamic tags;
@dynamic updated;

- (NSString *)status {
    return [self.dictionary objectForKey:@"count"];
}


- (NSString *)book_id {
    return [self.dictionary objectForKey:@"name"];
}

- (NSString *)tags {
    return [self.dictionary objectForKey:@"name"];
}

- (NSString *)updated {
    return [self.dictionary objectForKey:@"name"];
}

@end
