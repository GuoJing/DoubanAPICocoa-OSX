//
//  DOUBroadcastMedia.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-22.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUBroadcastMedia.h"

@implementation DOUBroadcastMedia

@dynamic src;
@dynamic secretPid;
@dynamic originalSrc;
@dynamic href;
@dynamic type;
@dynamic sizes;

- (NSString *)src {
    return [self.dictionary objectForKey:@"src"];
}

- (NSString *)secretPid {
    return [self.dictionary objectForKey:@"secret_pid"];
}

- (NSString *)originalSrc {
    return [self.dictionary objectForKey:@"original_src"];
}

- (NSString *)href {
    return [self.dictionary objectForKey:@"href"];
}

- (NSString *)type {
    return [self.dictionary objectForKey:@"type"];
}

- (NSString *)sizes {
    return [self.dictionary objectForKey:@"sizes"];
}

@end
