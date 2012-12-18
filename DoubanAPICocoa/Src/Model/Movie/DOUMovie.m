//
//  DOUMovie.m
//  DoubanAPIEngine
//
//  Created by GUO Lin on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUMovie.h"
#import "DOUObject+Utils.h"


@implementation DOUMovie

@dynamic identifier;
@dynamic title;
@dynamic originalTitle;
@dynamic stars;
@dynamic rating;

@dynamic publishTimeStr;
@dynamic publishTime;

@dynamic numRaters;
@dynamic average;
@dynamic image;
@dynamic largeImage;
@dynamic smallImage;
@dynamic mediumImage;

@dynamic wishCount;
@dynamic collectionCount;

- (NSString *)identifier {
  return [self.dictionary objectForKey:@"id"];
}

- (NSString *)originalTitle {
  return [self.dictionary objectForKey:@"orignal_title"];
}

- (NSString *)title {
  return [self.dictionary objectForKey:@"title"];
}


- (NSString *)stars {
  return [self.dictionary objectForKey:@"stars"];
}


- (NSString *)rating {
  return [self.dictionary objectForKey:@"rating"];
}


- (NSString *)publishTimeStr {
  return [self.dictionary objectForKey:@"pubdate"];
}

- (NSInteger)wishCount {
  return [[self.dictionary objectForKey:@"wish"] integerValue];
}

- (NSInteger)collectionCount {
  return [[self.dictionary objectForKey:@"collection"] integerValue];
}

- (NSString *)image {
    return [self.dictionary objectForKey:@"image"];
}

- (NSString *)numRaters {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"rating"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"numRaters"];
    }
}

- (NSString *)average {
    NSMutableDictionary *dic = [self.dictionary objectForKey:@"rating"];
    if (!dic) {
        return nil;
    } else {
        return [dic objectForKey:@"average"];
    }
}

- (NSString *)largeImage {
    return [self.image stringByReplacingOccurrencesOfString:@"spic" withString:@"lpic"];
}

- (NSString *)smallImage {
    return self.image;
}

- (NSString *)mediumImage {
    return [self.image stringByReplacingOccurrencesOfString:@"spic" withString:@"mpic"];
}

@end
