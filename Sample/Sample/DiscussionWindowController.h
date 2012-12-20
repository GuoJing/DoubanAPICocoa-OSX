//
//  DiscussionWindowController.h
//  Sample
//
//  Created by GuoJing on 12-12-20.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <DoubanAPICocoa/DOUEngine.h>

@interface DiscussionWindowController : NSWindowController {
    IBOutlet NSTextFieldCell *target_id_field;
    IBOutlet NSTextFieldCell *discussion_content_field;
    IBOutlet NSTextFieldCell *discussion_id_filed;
    IBOutlet NSTextFieldCell *comment_content_filed;
    
    IBOutlet NSTextFieldCell *d_id_filed;
    IBOutlet NSTextFieldCell *c_id_filed;
    IBOutlet NSTextFieldCell *d_id_content_field;
    IBOutlet NSTextFieldCell *c_id_content_field;
    
    IBOutlet NSButton *write_discussion_button;
    IBOutlet NSButton *delete_discussion_button;
    IBOutlet NSButton *get_discussion_button;
    IBOutlet NSButton *gets_discussion_button;
    IBOutlet NSButton *write_comment_button;
    IBOutlet NSButton *delete_comment_button;
    IBOutlet NSButton *get_comment_button;
    IBOutlet NSButton *gets_comment_button;
    
    DOUEngine *engine;
    IBOutlet NSTextFieldCell *info_field;
    IBOutlet NSProgressIndicator *progress;
}


@property (nonatomic, retain) IBOutlet NSTextFieldCell *target_id_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *discussion_content_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *discussion_id_filed;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *comment_content_filed;

@property (nonatomic, retain) IBOutlet NSTextFieldCell *d_id_filed;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *c_id_filed;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *d_id_content_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *c_id_content_field;

@property (nonatomic, retain) IBOutlet NSButton *get_discussion_button;
@property (nonatomic, retain) IBOutlet NSButton *write_discussion_button;
@property (nonatomic, retain) IBOutlet NSButton *delete_discussion_button;
@property (nonatomic, retain) IBOutlet NSButton *gets_discussion_button;
@property (nonatomic, retain) IBOutlet NSButton *write_comment_button;
@property (nonatomic, retain) IBOutlet NSButton *delete_comment_button;
@property (nonatomic, retain) IBOutlet NSButton *get_comment_button;
@property (nonatomic, retain) IBOutlet NSButton *gets_comment_button;

@property (nonatomic, retain) DOUEngine *engine;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *info_field;
@property (nonatomic, retain) IBOutlet NSProgressIndicator *progress;

- (IBAction)onWriteDiscussionButtonClicked:(id)sender;
- (IBAction)onDeleteDiscussionButtonClicked:(id)sender;
- (IBAction)onGetDiscussionButtonClicked:(id)sender;
- (IBAction)onGetsDiscussionButtonClicked:(id)sender;

- (IBAction)onWriteCommentButtonClicked:(id)sender;
- (IBAction)onDeleteCommentButtonClicked:(id)sender;
- (IBAction)onGetCommentButtonClicked:(id)sender;
- (IBAction)onGetsCommentButtonClicked:(id)sender;

@end
