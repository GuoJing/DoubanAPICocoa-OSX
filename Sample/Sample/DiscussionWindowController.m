//
//  DiscussionWindowController.m
//  Sample
//
//  Created by GuoJing on 12-12-20.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DiscussionWindowController.h"
#import "Consts.h"

#import <DoubanAPICocoa/DOUCommentEngine.h>
#import <DoubanAPICocoa/DOUDiscussionEngine.h>

@implementation DiscussionWindowController

@synthesize target_id_field;
@synthesize discussion_content_field;
@synthesize discussion_id_filed;
@synthesize comment_content_filed;

@synthesize d_id_filed;
@synthesize c_id_filed;
@synthesize d_id_content_field;
@synthesize c_id_content_field;

@synthesize write_discussion_button;
@synthesize delete_discussion_button;
@synthesize get_discussion_button;
@synthesize gets_discussion_button;
@synthesize write_comment_button;
@synthesize delete_comment_button;
@synthesize get_comment_button;
@synthesize gets_comment_button;

@synthesize engine;
@synthesize info_field;
@synthesize progress;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        self.engine = [[DOUEngine alloc] initWithApiKey:kAPIKey withSecretKey:kPrivateKey withRedirUrl:kRedirectUrl];
        [[self progress] setDisplayedWhenStopped:YES];
    }
    
    return self;
}

- (void)awakeFromNib {
    if ([self.engine isServiceValid]) {
        self.info_field.title = @"已在豆瓣验证";
    }
    [[self progress] stopAnimation:self];
}

- (IBAction)onWriteDiscussionButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    void(^successBlock)(NSString *) = ^(NSString *b) {
        self.info_field.title = @"成功!";
        NSLog(@"%@", b);
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        NSLog(@"%@", e);
    };
    DOUDiscussionEngine *eng = [self.engine getEngine:kDOUDiscussion];
    [eng writeDiscussionWithTarget:@"event" withTargetID:self.target_id_field.title withTitle:@"你好吗？" withContent:self.discussion_content_field.title successBlock:successBlock     failedBlock:failBlock];
}

- (IBAction)onDeleteDiscussionButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    void(^successBlock)(NSString *) = ^(NSString *d) {
        self.info_field.title = @"成功!";
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        NSLog(@"%@", e);
    };
    DOUDiscussionEngine *eng = [self.engine getEngine:kDOUDiscussion];
    [eng deleteDiscussionWithRemoteID:self.d_id_filed.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onGetDiscussionButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    void(^successBlock)(DOUDiscussion *) = ^(DOUDiscussion *d) {
        self.info_field.title = @"成功!";
        self.d_id_content_field.title = d.content;
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        NSLog(@"%@", e);
    };
    DOUDiscussionEngine *eng = [self.engine getEngine:kDOUDiscussion];
    [eng getDiscussionWithRemoteID:self.d_id_filed.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onGetsDiscussionButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    void(^successBlock)(DOUDiscussionArray *) = ^(DOUDiscussionArray *ds) {
        self.info_field.title = @"成功!";
        DOUDiscussion *d = [[ds objectArray] objectAtIndex:0];
        NSLog(@"%@", d.title);
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        NSLog(@"%@", e);
    };
    DOUDiscussionEngine *eng = [self.engine getEngine:kDOUDiscussion];
    [eng getDiscussionListWithTarget:@"event" withTargetID:self.target_id_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onWriteCommentButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    void(^successBlock)(NSString *) = ^(NSString *b) {
        self.info_field.title = @"成功!";
        NSLog(@"%@", b);
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        NSLog(@"%@", e);
    };
    DOUCommentEngine *eng = [self.engine getEngine:kDOUComment];
    [eng writeCommentWithTarget:@"discussion" withTargetID:self.discussion_id_filed.title withContent:self.comment_content_filed.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onDeleteCommentButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    void(^successBlock)(NSString *) = ^(NSString *c) {
        self.info_field.title = @"成功!";
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        NSLog(@"%@", e);
    };
    DOUCommentEngine *eng = [self.engine getEngine:kDOUComment];
    [eng deleteCommentWithTarget:@"discussion" withTargetID:self.d_id_filed.title withCommentID:self.c_id_filed.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onGetCommentButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    void(^successBlock)(DOUComment *) = ^(DOUComment *c) {
        self.info_field.title = @"成功!";
        self.c_id_content_field.title = c.content;
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        NSLog(@"%@", e);
    };
    DOUCommentEngine *eng = [self.engine getEngine:kDOUComment];
    [eng getCommentWithTarget:@"discussion" withTargetID:self.d_id_filed.title withCommentID:self.c_id_filed.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onGetsCommentButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    void(^successBlock)(DOUCommentArray *) = ^(DOUCommentArray *ds) {
        self.info_field.title = @"成功!";
        if ([ds objectArray].count > 0) {
            DOUComment *d = [[ds objectArray] objectAtIndex:0];
            NSLog(@"%@", d.content);
        }
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        NSLog(@"%@", e);
    };
    DOUCommentEngine *eng = [self.engine getEngine:kDOUComment];
    [eng getCommentListWithTarget:@"discussion" withTargetID:self.discussion_id_filed.title successBlock:successBlock failedBlock:failBlock];
}

@end
