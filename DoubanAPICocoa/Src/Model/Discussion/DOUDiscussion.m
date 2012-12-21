//
//  DOUDiscussion.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-20.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUDiscussion.h"

@implementation DOUDiscussion

@dynamic identifier;
@dynamic title;
@dynamic content;
@dynamic commentsCount;
@dynamic alt;
@dynamic updated;
@dynamic author;

- (NSString *)identifier {
    return [self.dictionary objectForKey:@"id"];
}

- (NSString *)title {
    return [self.dictionary objectForKey:@"title"];
}

- (NSString *)content {
    return [self.dictionary objectForKey:@"content"];
}

- (NSString *)commentsCount {
    return [self.dictionary objectForKey:@"comments_count"];
}

- (NSString *)alt {
    return [self.dictionary objectForKey:@"alt"];
}

- (NSDate *)updated {
    return [self.dictionary objectForKey:@"updated"];
}


- (DOUUser *)author {
    NSDictionary *dic = [self.dictionary objectForKey:@"author"];
    DOUUser *user = [DOUUser objectWithDictionary:dic];
    return user;
}

@end
