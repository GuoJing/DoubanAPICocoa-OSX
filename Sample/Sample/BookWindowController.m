//
//  BookWindowController.m
//  Sample
//
//  Created by GuoJing on 12-12-16.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "BookWindowController.h"

#import "Consts.h"
#import <DoubanAPICocoa/DOUEngine.h>
#import <DoubanAPICocoa/DOUConsts.h>
#import <DoubanAPICocoa/DOUBookEngine.h>

@implementation BookWindowController

@synthesize get_button;
@synthesize engine;
@synthesize pic_cell;
@synthesize info_field;
@synthesize info_field2;
@synthesize progress;
@synthesize title_field;
@synthesize rate_field;
@synthesize bid_field;

@synthesize wish_button;
@synthesize reading_button;
@synthesize read_button;
@synthesize delete_collect_button;

@synthesize annotation_text;
@synthesize annotation_button;
@synthesize review_text;
@synthesize review_button;

@synthesize annotation_id_field;
@synthesize annotation_text_field;
@synthesize get_annotation_button;
@synthesize edit_annotation_button;
@synthesize delete_annotation_button;

@synthesize review_id_field;
@synthesize review_text_field;
@synthesize get_review_button;
@synthesize edit_review_button;
@synthesize delete_review_button;

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
    [self.wish_button setEnabled:NO];
    [self.reading_button setEnabled:NO];
    [self.read_button setEnabled:NO];
}

- (IBAction)onGetClicked:(id)sender{
    self.info_field.title = @"等待网络请求...";
    [[self progress] startAnimation:nil];
    void(^successBlock)(DOUBook *) = ^(DOUBook *book) {
        [[self progress] stopAnimation:self];
        NSImage *post=nil;
        NSString *poster_url = [book mediumImage];
        NSURL *poster_image = [NSURL URLWithString:poster_url];
        NSData *poster_data = [NSData dataWithContentsOfURL:poster_image];
        if (poster_data) {
            post = [[NSImage alloc] initWithData:poster_data];
            [self.pic_cell setImage:post];
            self.title_field.title = book.title;
            self.rate_field.title = book.average;
            self.info_field.title = @"成功!";
        } else {
            self.info_field.title = @"显示图片失败!";
        }
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        NSLog(@"Failed %@", e);
    };
    void(^collectSuccessBlock)(DOUCollection *) = ^(DOUCollection *collection) {
        NSString *status = [collection status];
        
        [self updateReadStatusUI:status];
    };
    void(^collectFailBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        [self updateReadStatusUI:nil];
    };
    DOUBookEngine *book_engine = [self.engine getEngine:kDOUBook];
    [book_engine getBookWithRemoteID:self.bid_field.title successBlock:successBlock failedBlock:failBlock];
    [book_engine getUserCollectionWithRemoteBookID:self.bid_field.title successBlock:collectSuccessBlock failedBlock:collectFailBlock];
}

- (IBAction)onWishButtonClicked:(id)sender{
    void(^successBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        NSLog(@"Success %@", e);
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        NSLog(@"Failed %@", e);
    };
    DOUBookEngine *book_engine = [self.engine getEngine:kDOUBook];
    [book_engine collectBookWithRemoteID:self.bid_field.title status:kDOUBookactionWish tags:@"" comment:@"This is a wish comment" privacy:kDOUPrivacyPublic rating:FOUR successBlock:successBlock failedBlock:failBlock];
    [self updateReadStatusUI:kDOUBookactionWish];
}
- (IBAction)onReadingButtonClicked:(id)sender{
    void(^successBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        NSLog(@"Success %@", e);
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        NSLog(@"Failed %@", e);
    };
    DOUBookEngine *book_engine = [self.engine getEngine:kDOUBook];
    [book_engine collectBookWithRemoteID:self.bid_field.title status:kDOUBookactionReading tags:@"" comment:@"This is a reading comment" privacy:kDOUPrivacyPublic rating:FOUR successBlock:successBlock failedBlock:failBlock];
    [self updateReadStatusUI:kDOUBookactionReading];
}
- (IBAction)onReadButtonClicked:(id)sender{
    void(^successBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        NSLog(@"Success %@", e);
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        NSLog(@"Failed %@", e);
    };
    DOUBookEngine *book_engine = [self.engine getEngine:kDOUBook];
    [book_engine collectBookWithRemoteID:self.bid_field.title status:kDOUBookactionRead tags:@"" comment:@"This is a read comment" privacy:kDOUPrivacyPublic rating:FOUR successBlock:successBlock failedBlock:failBlock];
    [self updateReadStatusUI:kDOUBookactionRead];
}

- (void)updateReadStatusUI:(NSString *)status{
    if ([status isEqualToString:kDOUBookactionWish]) {
        [self.wish_button setEnabled:NO];
        [self.reading_button setEnabled:YES];
        [self.read_button setEnabled:YES];
        [self.delete_collect_button setEnabled:YES];
    } else if ([status isEqualToString:kDOUBookactionReading]) {
        [self.wish_button setEnabled:YES];
        [self.reading_button setEnabled:NO];
        [self.read_button setEnabled:YES];
        [self.delete_collect_button setEnabled:YES];
    } else if ([status isEqualToString:kDOUBookactionRead]) {
        [self.wish_button setEnabled:YES];
        [self.reading_button setEnabled:YES];
        [self.read_button setEnabled:NO];
        [self.delete_collect_button setEnabled:YES];
    } else {
        [self.wish_button setEnabled:YES];
        [self.reading_button setEnabled:YES];
        [self.read_button setEnabled:YES];
        [self.delete_collect_button setEnabled:NO];
    }
}

- (IBAction)onDelteCollectButtonClicked:(id)sender {
    void(^successBlock)(NSString *) = ^(NSString *e) {
        [self updateReadStatusUI:nil];
    };
    DOUBookEngine *book_engine = [self.engine getEngine:kDOUBook];
    [book_engine deleteBookCollectWithRemoteID:self.bid_field.title successBlock:successBlock failedBlock:nil];
}

- (IBAction)onAnnotationButtonClicked:(id)sender{
    void(^successBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        self.info_field.title = @"成功";
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        self.info_field.title = @"失败";
    };
    DOUBookEngine *book_engine = [self.engine getEngine:kDOUBook];
    [book_engine writeAnnotationWithBookID:self.bid_field.title withContet:self.annotation_text.title withPage:@"20" withChapter:@"20" withPrivacy:@"" successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onReviewButtonClicked:(id)sender{
    void(^successBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        self.info_field.title = @"成功";
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        self.info_field.title = @"失败";
    };
    DOUBookEngine *book_engine = [self.engine getEngine:kDOUBook];
    [book_engine writeReviewWithBookID:self.bid_field.title title:@"测试评论" content:self.review_text.title rating:FOUR successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onGetAnnotationButtonClicked:(id)sender{
    DOUBookEngine *book_engine = [self.engine getEngine:kDOUBook];
    void(^successBlock)(DOUAnnotation *) = ^(DOUAnnotation *a) {
        self.info_field2.title = @"成功";
        self.annotation_text_field.title = [a abstract];
        [self.edit_annotation_button setEnabled:YES];
        [self.delete_annotation_button setEnabled:YES];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field2.title = @"失败";
        [self.edit_annotation_button setEnabled:NO];
        [self.delete_annotation_button setEnabled:NO];
        NSLog(@"%@", e);
    };
    [book_engine getAnnotationWithRemoteID:self.annotation_id_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onEditAnnotationButtonClicked:(id)sender{
    DOUBookEngine *book_engine = [self.engine getEngine:kDOUBook];
    void(^successBlock)(NSString *) = ^(NSString *a) {
        self.info_field2.title = @"成功";
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field2.title = @"失败";
        NSLog(@"%@", e);
    };
    [book_engine editAnnotation:self.annotation_id_field.title withContet:self.annotation_text_field.title withPage:@"20" withChapter:@"20" withPrivacy:@"" successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onDeleteAnnotationButtonClicked:(id)sender{
    DOUBookEngine *book_engine = [self.engine getEngine:kDOUBook];
    [book_engine deleteAnnotation:self.annotation_id_field.title successBlock:nil failedBlock:nil];
}

- (IBAction)onEditReviwButtonClicked:(id)sender{
    DOUBookEngine *book_engine = [self.engine getEngine:kDOUBook];
    [book_engine editReview:self.review_id_field.title title:@"测试修改评论" content:self.review_text_field.title rating:FOUR successBlock:nil failedBlock:nil];
}

- (IBAction)onDeleteReviewButtonClicked:(id)sender{
    DOUBookEngine *book_engine = [self.engine getEngine:kDOUBook];
    [book_engine deleteReview:self.review_id_field.title successBlock:nil failedBlock:nil];
}

@end
