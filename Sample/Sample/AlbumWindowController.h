//
//  AlbumWindowController.h
//  Sample
//
//  Created by GuoJing on 12-12-20.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <DoubanAPICocoa/DOUEngine.h>

@interface AlbumWindowController : NSWindowController {
    IBOutlet NSTextFieldCell *album_title_field;
    IBOutlet NSTextFieldCell *album_desc_field;
    IBOutlet NSTextFieldCell *album_id_field;
    IBOutlet NSTextFieldCell *photo_id_field;
    
    IBOutlet NSButton *create_button;
    IBOutlet NSButton *choose_button;
    IBOutlet NSButton *upload_button;
    IBOutlet NSButton *edit_album_button;
    IBOutlet NSButton *delete_album_button;
    IBOutlet NSButton *edit_photo_button;
    IBOutlet NSButton *delete_photo_button;
    
    NSData *image_data;
    DOUEngine *engine;
    IBOutlet NSTextFieldCell *info_field;
    IBOutlet NSProgressIndicator *progress;
}

@property (nonatomic, retain) IBOutlet NSTextFieldCell *album_title_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *album_desc_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *album_id_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *photo_id_field;

@property (nonatomic, retain) IBOutlet NSButton *create_button;
@property (nonatomic, retain) IBOutlet NSButton *choose_button;
@property (nonatomic, retain) IBOutlet NSButton *upload_button;
@property (nonatomic, retain) IBOutlet NSButton *edit_album_button;
@property (nonatomic, retain) IBOutlet NSButton *delete_album_button;
@property (nonatomic, retain) IBOutlet NSButton *edit_photo_button;
@property (nonatomic, retain) IBOutlet NSButton *delete_photo_button;

@property (nonatomic, retain) NSData *image_data;
@property (nonatomic, retain) DOUEngine *engine;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *info_field;
@property (nonatomic, retain) IBOutlet NSProgressIndicator *progress;

- (IBAction)onCreateButtonClicked:(id)sender;
- (IBAction)onChooseButtonClicked:(id)sender;
- (IBAction)onUploadButtonClicked:(id)sender;
- (IBAction)onEditAlbumButtonClicked:(id)sender;
- (IBAction)onDeleteAlbumButtonClicked:(id)sender;
- (IBAction)onEditPhotoButtonClicked:(id)sender;
- (IBAction)onDeletePhotoButtonClicked:(id)sender;

@end
