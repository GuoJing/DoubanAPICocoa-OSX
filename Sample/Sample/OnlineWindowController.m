//
//  OnlineWindowController.m
//  Sample
//
//  Created by GuoJing on 12-12-21.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "OnlineWindowController.h"
#import "Consts.h"

#import <DoubanAPICocoa/DOUOnlineEngine.h>

@implementation OnlineWindowController

@synthesize online_title_field;
@synthesize online_id_field;

@synthesize attend_button;
@synthesize quit_button;
@synthesize like_button;
@synthesize unlike_button;

@synthesize create_button;
@synthesize get_button;
@synthesize delete_button;

@synthesize choose_button;
@synthesize upload_button;

@synthesize image_data;
@synthesize engine;
@synthesize info_field;
@synthesize progress;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        self.engine = [[DOUEngine alloc] initWithApiKey:kAPIKey withSecretKey:kPrivateKey withRedirUrl:kRedirectUrl];
        [[self progress] setDisplayedWhenStopped:YES];
        self.image_data = nil;
    }
    
    return self;
}

- (void)awakeFromNib {
    if ([self.engine isServiceValid]) {
        self.info_field.title = @"已在豆瓣验证";
    }
    [[self progress] stopAnimation:self];
}

- (IBAction)onAttendButtonClicked:(id)sender{
    DOUOnlineEngine *eng = [self.engine getEngine:kDOUOnline];
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
    [eng attendOnlineWithID:self.online_id_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onQuitButtonClicked:(id)sender{
    DOUOnlineEngine *eng = [self.engine getEngine:kDOUOnline];
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
    [eng quitOnlineWithID:self.online_id_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onLikeButtonClicked:(id)sender{
    DOUOnlineEngine *eng = [self.engine getEngine:kDOUOnline];
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
    [eng likeOnlineWithID:self.online_id_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onUnlikeButtonClicked:(id)sender{
    DOUOnlineEngine *eng = [self.engine getEngine:kDOUOnline];
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
    [eng unLikeOnlineWithID:self.online_id_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onCreateButtonClicked:(id)sender{
    DOUOnlineEngine *eng = [self.engine getEngine:kDOUOnline];
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
    [eng createOnlineWithTitle:self.online_title_field.title withDesc:@"test desc" withBeginTime:@"2013-01-01 10:10" withEndTime:@"2013-01-04 10:10" withRelatedUrl:@"" withCascadeInvite:kDOUFalse withTags:@"test" successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onGetButtonClicked:(id)sender{
    DOUOnlineEngine *eng = [self.engine getEngine:kDOUOnline];
    [[self progress] startAnimation:self];
    void(^successBlock)(DOUOnline *) = ^(DOUOnline *b) {
        self.info_field.title = @"成功!";
        self.online_title_field.title = b.title;
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        NSLog(@"%@", e);
    };
    [eng getOnlineWithRemoteID:self.online_id_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onDeleteButtonClicked:(id)sender{
    DOUOnlineEngine *eng = [self.engine getEngine:kDOUOnline];
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
    [eng deleteOnlineWithID:self.online_id_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onChooseButtonClicked:(id)sender{
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    [openDlg setCanChooseFiles:YES];
    [openDlg setCanChooseDirectories:NO];
    NSArray *fileTypesArray;
    fileTypesArray = [NSArray arrayWithObjects:@"jpg", @"gif", @"png", nil];
    [openDlg setPrompt:NSLocalizedString(@"选择图片", nil)];
    [openDlg setAllowedFileTypes:fileTypesArray];
    
    if ([openDlg runModal] == NSOKButton) {
        NSURL* path = [[openDlg URLs] objectAtIndex:0];
        NSData *data = [[NSData alloc] initWithContentsOfURL:path];
        self.image_data = data;
    }
}

- (IBAction)onUploadButtonClicked:(id)sender{
    DOUOnlineEngine *eng = [self.engine getEngine:kDOUOnline];
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
    [eng uploadPhotoWithOnlineID:self.online_id_field.title withImageData:self.image_data withDesc:@"oh yeah" successBlock:successBlock failedBlock:failBlock];
}
@end
