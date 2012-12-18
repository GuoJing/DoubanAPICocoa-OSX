//
//  DOUMusic.m
//  DoubanAPIEngine
//
//  Created by Panglv on 12/5/12.
//  Copyright (c) 2012 Douban Inc. All rights reserved.
//

#import "DOUMusic.h"
#import "DOUObject+Utils.h"


@implementation DOUMusic

@dynamic identifier;
@dynamic title;
@dynamic altTitle;
@dynamic rating;

@dynamic publisher;

@dynamic publishDateStr;
@dynamic publishDate;

@dynamic image;
@dynamic largeImage;
@dynamic smallImage;
@dynamic mediumImage;

@dynamic numRaters;
@dynamic average;

- (NSString *)identifier {
  return [self.dictionary objectForKey:@"id"];
}

- (NSString *)altTitle {
  return [self.dictionary objectForKey:@"alt_title"];
}

- (NSString *)title {
  return [self.dictionary objectForKey:@"title"];
}


- (NSString *)publisher {
  return [[[self.dictionary objectForKey:@"attrs"] objectForKey:@"publisher"] objectAtIndex:0];
}


- (NSString *)rating {
  return [[self.dictionary objectForKey:@"rating"] objectForKey:@"average"];
}


- (NSString *)publishDateStr {
  return [[[self.dictionary objectForKey:@"attrs"] objectForKey:@"pubdate"] objectAtIndex:0];
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
