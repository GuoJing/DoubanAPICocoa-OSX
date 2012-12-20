//
//  NoteWindowController.m
//  Sample
//
//  Created by GuoJing on 12-12-20.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "NoteWindowController.h"
#import "Consts.h"

#import <DoubanAPICocoa/DOUNoteEngine.h>

@implementation NoteWindowController

@synthesize write_field;
@synthesize ops_noteid_field;
@synthesize like_noteid_field;
@synthesize user_id_field;

@synthesize write_button;
@synthesize delete_button;
@synthesize edit_button;
@synthesize like_button;
@synthesize unlike_button;
@synthesize get_user_note_button;
@synthesize get_user_liked_button;

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

- (IBAction)onWriteButtonClicked:(id)sender{
    DOUNoteEngine *eng = [self.engine getEngine:kDOUNote];
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
    [eng writeNoteWithTitle:@"爱你的日记" withPrivacy:kDOUPrivacyPublic withCanReply:kDOUTrue withContent:self.write_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onEditButtonClicked:(id)sender{
    DOUNoteEngine *eng = [self.engine getEngine:kDOUNote];
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
    NSString *edit_str = [[NSString alloc] initWithFormat:@"%@ --edited", self.write_field.title];
    [eng editNoteWithRemoteID:self.ops_noteid_field.title withTitle:@"爱你的修改日记。" withPrivacy:kDOUPrivacyPublic withCanReply:kDOUTrue withContent:edit_str successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onDeleteButtonClicked:(id)sender{
    DOUNoteEngine *eng = [self.engine getEngine:kDOUNote];
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
    [eng deleteNoteWithRemoteID:self.ops_noteid_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onLikeButtonClicked:(id)sender{
    DOUNoteEngine *eng = [self.engine getEngine:kDOUNote];
    [[self progress] startAnimation:self];
    void(^successBlock)(NSString *) = ^(NSString *b) {
        self.info_field.title = @"成功!";
        NSLog(@"%@", b);
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        NSLog(@"failed %@", e);
    };
    [eng likeNoteWithNoteID:self.like_noteid_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onUnlikeButtonClicked:(id)sender{
    DOUNoteEngine *eng = [self.engine getEngine:kDOUNote];
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
    [eng unLikeNoteWithNoteID:self.like_noteid_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onGetUserNotesButtonClicked:(id)sender{
    DOUNoteEngine *eng = [self.engine getEngine:kDOUNote];
    [[self progress] startAnimation:self];
    void(^successBlock)(DOUNoteArray *) = ^(DOUNoteArray *notes) {
        self.info_field.title = @"成功!";
        DOUNote *note = [[notes objectArray] objectAtIndex:0];
        NSLog(@"%@", note.title);
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        NSLog(@"%@", e);
    };
    [eng getNotesWithUserID:self.user_id_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onGetUserLikedNotesButtonClicked:(id)sender{
    DOUNoteEngine *eng = [self.engine getEngine:kDOUNote];
    [[self progress] startAnimation:self];
    void(^successBlock)(DOUNoteArray *) = ^(DOUNoteArray *notes) {
        self.info_field.title = @"成功!";
        DOUNote *note = [[notes objectArray] objectAtIndex:0];
        NSLog(@"%@", note.title);
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        NSLog(@"%@", e);
    };
    [eng getUserLikedNotesWithUserID:self.user_id_field.title successBlock:successBlock failedBlock:failBlock];
}

@end
