//
//  MovieWindowController.m
//  Sample
//
//  Created by bettylwx's on 12-12-18.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "MovieWindowController.h"
#import "Consts.h"

#import <DoubanAPICocoa/DOUEngine.h>
#import <DoubanAPICocoa/DOUConsts.h>
#import <DoubanAPICocoa/DOUMovieEngine.h>

@implementation MovieWindowController

@synthesize review_button;
@synthesize get_button;
@synthesize engine;
@synthesize pic_cell;
@synthesize info_field;
@synthesize progress;
@synthesize review_field;
@synthesize title_field;
@synthesize rate_field;
@synthesize id_field;
@synthesize edit_review_button;
@synthesize delete_review_button;
@synthesize review_id_field;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        self.engine = [[DOUEngine alloc] initWithApiKey:kAPIKey withSecretKey:kPrivateKey withRedirUrl:kRedirectUrl];
    }
    
    return self;
}

- (void)awakeFromNib {
    if ([self.engine isServiceValid]) {
        self.info_field.title = @"已在豆瓣验证";
    }
    [[self progress] stopAnimation:self];
}

- (IBAction)onGetClicked:(id)sender{
    [[self progress] startAnimation:self];
    self.info_field.title = @"获取网络请求...";
    DOUMovieEngine *movie_engine = [self.engine getEngine:kDOUMovie];
    void(^successBlock)(DOUMovie *) = ^(DOUMovie *movie) {
        [[self progress] stopAnimation:self];
        NSImage *post=nil;
        NSString *poster_url = [movie largeImage];
        NSURL *poster_image = [NSURL URLWithString:poster_url];
        NSData *poster_data = [NSData dataWithContentsOfURL:poster_image];
        if (poster_data) {
            post = [[NSImage alloc] initWithData:poster_data];
            [self.pic_cell setImage:post];
            self.title_field.title = movie.title;
            self.rate_field.title = movie.average;
            self.info_field.title = @"成功!";
        } else {
            self.info_field.title = @"显示图片失败!";
        }
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        self.info_field.title = @"失败!";
        NSLog(@"Failed %@", e);
    };
    [movie_engine getMovieWithRemoteID:self.id_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onReviewButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    void(^successBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"成功!";
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        self.info_field.title = @"失败!";
        NSLog(@"Failed %@", e);
    };
    DOUMovieEngine *movie_engine = [self.engine getEngine:kDOUMovie];
    [movie_engine writeReview:self.id_field.title title:@"测试电影长评" content:self.review_field.title rating:FIVE successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onEditReviewButtonClicked:(id)sender{
    DOUMovieEngine *movie_engine = [self.engine getEngine:kDOUMovie];
    NSString *edit_content = [[NSString alloc] initWithFormat:@"%@---%@", self.review_field.title, @"edit"];
    [movie_engine editReview:self.review_id_field.title title:@"edited" content:edit_content rating:ONE successBlock:nil failedBlock:nil];
}

- (IBAction)onDeleteReviewButtonClicked:(id)sender{
    DOUMovieEngine *movie_engine = [self.engine getEngine:kDOUMovie];
    [movie_engine deleteReview:self.review_id_field.title successBlock:nil failedBlock:nil];
}

@end
