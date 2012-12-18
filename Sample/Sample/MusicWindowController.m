//
//  MusicWindowController.m
//  Sample
//
//  Created by bettylwx's on 12-12-18.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "MusicWindowController.h"
#import "Consts.h"

#import <DoubanAPICocoa/DOUEngine.h>
#import <DoubanAPICocoa/DOUConsts.h>
#import <DoubanAPICocoa/DOUMusicEngine.h>

@implementation MusicWindowController

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
    DOUMusicEngine *music_engine = [self.engine getEngine:kDOUMusic];
    void(^successBlock)(DOUMusic *) = ^(DOUMusic *music) {
        [[self progress] stopAnimation:self];
        NSImage *post=nil;
        NSString *poster_url = [music largeImage];
        NSURL *poster_image = [NSURL URLWithString:poster_url];
        NSData *poster_data = [NSData dataWithContentsOfURL:poster_image];
        if (poster_data) {
            post = [[NSImage alloc] initWithData:poster_data];
            [self.pic_cell setImage:post];
            self.title_field.title = music.title;
            self.rate_field.title = music.average;
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
    [music_engine getMusicWithRemoteID:self.id_field.title successBlock:successBlock failedBlock:failBlock];
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
    DOUMusicEngine *music_engine = [self.engine getEngine:kDOUMusic];
    [music_engine writeReview:self.id_field.title title:@"测试音乐长评" content:self.review_field.title rating:FIVE successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onEditReviewButtonClicked:(id)sender{
    DOUMusicEngine *music_engine = [self.engine getEngine:kDOUMusic];
    NSString *edit_content = [[NSString alloc] initWithFormat:@"%@---%@", self.review_field.title, @"edit"];
    [music_engine editReview:self.review_id_field.title title:@"edited" content:edit_content rating:FIVE successBlock:nil failedBlock:nil];
}

- (IBAction)onDeleteReviewButtonClicked:(id)sender{
    DOUMusicEngine *music_engine = [self.engine getEngine:kDOUMusic];
    [music_engine deleteReview:self.review_id_field.title successBlock:nil failedBlock:nil];
}


@end
