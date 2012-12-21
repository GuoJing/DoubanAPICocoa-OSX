//
//  OnlineWindowController.h
//  Sample
//
//  Created by GuoJing on 12-12-21.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DoubanAPICocoa/DOUEngine.h>

@interface OnlineWindowController : NSWindowController {
    IBOutlet NSTextFieldCell *online_title_field;
    IBOutlet NSTextFieldCell *online_id_field;
    
    IBOutlet NSButton *attend_button;
    IBOutlet NSButton *quit_button;
    IBOutlet NSButton *like_button;
    IBOutlet NSButton *unlike_button;
    
    IBOutlet NSButton *create_button;
    IBOutlet NSButton *get_button;
    IBOutlet NSButton *delete_button;
    
    IBOutlet NSButton *choose_button;
    IBOutlet NSButton *upload_button;
    
    NSData *image_data;
    DOUEngine *engine;
    IBOutlet NSTextFieldCell *info_field;
    IBOutlet NSProgressIndicator *progress;
}

@property (nonatomic, retain) IBOutlet NSTextFieldCell *online_title_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *online_id_field;

@property (nonatomic, retain) IBOutlet NSButton *attend_button;
@property (nonatomic, retain) IBOutlet NSButton *quit_button;
@property (nonatomic, retain) IBOutlet NSButton *like_button;
@property (nonatomic, retain) IBOutlet NSButton *unlike_button;

@property (nonatomic, retain) IBOutlet NSButton *create_button;
@property (nonatomic, retain) IBOutlet NSButton *get_button;
@property (nonatomic, retain) IBOutlet NSButton *delete_button;

@property (nonatomic, retain) IBOutlet NSButton *choose_button;
@property (nonatomic, retain) IBOutlet NSButton *upload_button;

@property (nonatomic, retain) NSData *image_data;
@property (nonatomic, retain) DOUEngine *engine;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *info_field;
@property (nonatomic, retain) IBOutlet NSProgressIndicator *progress;

- (IBAction)onAttendButtonClicked:(id)sender;
- (IBAction)onQuitButtonClicked:(id)sender;
- (IBAction)onLikeButtonClicked:(id)sender;
- (IBAction)onUnlikeButtonClicked:(id)sender;
- (IBAction)onCreateButtonClicked:(id)sender;
- (IBAction)onGetButtonClicked:(id)sender;
- (IBAction)onDeleteButtonClicked:(id)sender;
- (IBAction)onChooseButtonClicked:(id)sender;
- (IBAction)onUploadButtonClicked:(id)sender;

@end
