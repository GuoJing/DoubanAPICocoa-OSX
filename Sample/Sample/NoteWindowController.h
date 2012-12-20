//
//  NoteWindowController.h
//  Sample
//
//  Created by GuoJing on 12-12-20.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <DoubanAPICocoa/DOUEngine.h>

@interface NoteWindowController : NSWindowController {
    IBOutlet NSTextFieldCell *write_field;
    IBOutlet NSTextFieldCell *ops_noteid_field;
    IBOutlet NSTextFieldCell *like_noteid_field;
    IBOutlet NSTextFieldCell *user_id_field;
    
    IBOutlet NSButton *write_button;
    IBOutlet NSButton *delete_button;
    IBOutlet NSButton *edit_button;
    IBOutlet NSButton *like_button;
    IBOutlet NSButton *unlike_button;
    IBOutlet NSButton *get_user_note_button;
    IBOutlet NSButton *get_user_liked_button;
    
    DOUEngine *engine;
    IBOutlet NSTextFieldCell *info_field;
    IBOutlet NSProgressIndicator *progress;
}

@property (nonatomic, retain) IBOutlet NSTextFieldCell *write_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *ops_noteid_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *like_noteid_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *user_id_field;

@property (nonatomic, retain) IBOutlet NSButton *write_button;
@property (nonatomic, retain) IBOutlet NSButton *delete_button;
@property (nonatomic, retain) IBOutlet NSButton *edit_button;
@property (nonatomic, retain) IBOutlet NSButton *like_button;
@property (nonatomic, retain) IBOutlet NSButton *unlike_button;
@property (nonatomic, retain) IBOutlet NSButton *get_user_note_button;
@property (nonatomic, retain) IBOutlet NSButton *get_user_liked_button;

@property (nonatomic, retain) DOUEngine *engine;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *info_field;
@property (nonatomic, retain) IBOutlet NSProgressIndicator *progress;

- (IBAction)onWriteButtonClicked:(id)sender;
- (IBAction)onEditButtonClicked:(id)sender;
- (IBAction)onDeleteButtonClicked:(id)sender;
- (IBAction)onLikeButtonClicked:(id)sender;
- (IBAction)onUnlikeButtonClicked:(id)sender;
- (IBAction)onGetUserNotesButtonClicked:(id)sender;
- (IBAction)onGetUserLikedNotesButtonClicked:(id)sender;

@end
