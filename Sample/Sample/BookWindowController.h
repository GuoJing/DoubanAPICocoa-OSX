//
//  BookWindowController.h
//  Sample
//
//  Created by GuoJing on 12-12-16.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <DoubanAPICocoa/DOUEngine.h>

@interface BookWindowController : NSWindowController {
    IBOutlet NSButton *get_button;
    IBOutlet NSImageCell *pic_cell;
    IBOutlet NSTextFieldCell *info_field;
    IBOutlet NSTextFieldCell *info_field2;
    IBOutlet NSProgressIndicator *progress;
    DOUEngine *engine;
    
    IBOutlet NSTextFieldCell *title_field;
    IBOutlet NSTextFieldCell *rate_field;
    IBOutlet NSTextFieldCell *bid_field;
    
    IBOutlet NSButton *wish_button;
    IBOutlet NSButton *reading_button;
    IBOutlet NSButton *read_button;
    IBOutlet NSButton *delete_collect_button;
    
    IBOutlet NSTextFieldCell *annotation_text;
    IBOutlet NSButton *annotation_button;
    IBOutlet NSTextFieldCell *review_text;
    IBOutlet NSButton *review_button;
    
    IBOutlet NSTextFieldCell *annotation_id_field;
    IBOutlet NSTextFieldCell *annotation_text_field;
    IBOutlet NSButton *get_annotation_button;
    IBOutlet NSButton *edit_annotation_button;
    IBOutlet NSButton *delete_annotation_button;
    
    IBOutlet NSTextFieldCell *review_id_field;
    IBOutlet NSTextFieldCell *review_text_field;
    IBOutlet NSButton *get_review_button;
    IBOutlet NSButton *edit_review_button;
    IBOutlet NSButton *delete_review_button;
}

@property (nonatomic, retain) DOUEngine *engine;
@property (nonatomic, retain) NSButton *get_button;
@property (nonatomic, retain) NSImageCell *pic_cell;
@property (nonatomic, retain) NSTextFieldCell *info_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *info_field2;
@property (nonatomic, retain) IBOutlet NSProgressIndicator *progress;

@property (nonatomic, retain) IBOutlet NSTextFieldCell *title_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *rate_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *bid_field;

@property (nonatomic, retain) IBOutlet NSButton *wish_button;
@property (nonatomic, retain) IBOutlet NSButton *reading_button;
@property (nonatomic, retain) IBOutlet NSButton *read_button;
@property (nonatomic, retain) IBOutlet NSButton *delete_collect_button;

@property (nonatomic, retain) IBOutlet NSTextFieldCell *annotation_text;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *review_text;
@property (nonatomic, retain) IBOutlet NSButton *annotation_button;
@property (nonatomic, retain) IBOutlet NSButton *review_button;

@property (nonatomic, retain) IBOutlet NSTextFieldCell *annotation_id_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *annotation_text_field;
@property (nonatomic, retain) IBOutlet NSButton *get_annotation_button;
@property (nonatomic, retain) IBOutlet NSButton *edit_annotation_button;
@property (nonatomic, retain) IBOutlet NSButton *delete_annotation_button;

@property (nonatomic, retain) IBOutlet NSTextFieldCell *review_id_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *review_text_field;
@property (nonatomic, retain) IBOutlet NSButton *get_review_button;
@property (nonatomic, retain) IBOutlet NSButton *edit_review_button;
@property (nonatomic, retain) IBOutlet NSButton *delete_review_button;

- (IBAction)onGetClicked:(id)sender;

- (IBAction)onWishButtonClicked:(id)sender;
- (IBAction)onReadingButtonClicked:(id)sender;
- (IBAction)onReadButtonClicked:(id)sender;

- (IBAction)onDelteCollectButtonClicked:(id)sender;

- (IBAction)onAnnotationButtonClicked:(id)sender;
- (IBAction)onReviewButtonClicked:(id)sender;

- (IBAction)onGetAnnotationButtonClicked:(id)sender;
- (IBAction)onEditAnnotationButtonClicked:(id)sender;
- (IBAction)onDeleteAnnotationButtonClicked:(id)sender;

- (IBAction)onEditReviwButtonClicked:(id)sender;
- (IBAction)onDeleteReviewButtonClicked:(id)sender;

@end
