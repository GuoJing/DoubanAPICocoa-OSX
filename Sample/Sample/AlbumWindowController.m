//
//  AlbumWindowController.m
//  Sample
//
//  Created by GuoJing on 12-12-20.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "AlbumWindowController.h"
#import "Consts.h"

#import <DoubanAPICocoa/DOUPhotoEngine.h>
#import <DoubanAPICocoa/DOUAlbumEngine.h>

@implementation AlbumWindowController

@synthesize album_title_field;
@synthesize album_desc_field;
@synthesize album_id_field;
@synthesize photo_id_field;

@synthesize create_button;
@synthesize choose_button;
@synthesize upload_button;
@synthesize edit_album_button;
@synthesize delete_album_button;
@synthesize edit_photo_button;
@synthesize delete_photo_button;

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

- (IBAction)onCreateButtonClicked:(id)sender{
    DOUAlbumEngine *eng = [self.engine getEngine:kDOUAlbum];
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
    [eng createAlbumWithTitle:self.album_title_field.title withDesc:self.album_desc_field.title withOrder:kDOUOrderAsc withPrivacy:kDOUPrivacyPublic successBlock:successBlock failedBlock:failBlock];
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
    DOUAlbumEngine *eng = [self.engine getEngine:kDOUAlbum];
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
    if (self.image_data) {
        [eng uploadPhotoWithAlbumID:self.album_id_field.title imageData:image_data withDesc:@"test desc" successBlock:successBlock failedBlock:failBlock];
    }
}

- (IBAction)onEditAlbumButtonClicked:(id)sender{
    DOUAlbumEngine *eng = [self.engine getEngine:kDOUAlbum];
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
    [eng editAlbumWithID:self.album_id_field.title withTitle:@"edited" withDesc:@"edited" withOrder:kDOUOrderAsc withPrivacy:kDOUPrivacyPublic successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onDeleteAlbumButtonClicked:(id)sender{
    DOUAlbumEngine *eng = [self.engine getEngine:kDOUAlbum];
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
    [eng deleteAlbumWithID:self.album_id_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onEditPhotoButtonClicked:(id)sender{
    DOUPhotoEngine *eng = [self.engine getEngine:kDOUPhoto];
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
    [eng editPhotoWithRemoteID:self.photo_id_field.title withDesc:@"another test desc" successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onDeletePhotoButtonClicked:(id)sender{
    DOUPhotoEngine *eng = [self.engine getEngine:kDOUPhoto];
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
    [eng deletePhotoWithRemoteID:self.photo_id_field.title successBlock:successBlock failedBlock:failBlock];
    
}

@end
