//
//  MusicWindowController.h
//  Sample
//
//  Created by bettylwx's on 12-12-18.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DoubanAPICocoa/DOUEngine.h>

@interface MusicWindowController : NSWindowController {
    IBOutlet NSButton *get_button;
    IBOutlet NSButton *review_button;
    IBOutlet NSImageCell *pic_cell;
    IBOutlet NSTextFieldCell *info_field;
    IBOutlet NSProgressIndicator *progress;
    DOUEngine *engine;
    
    IBOutlet NSTextFieldCell *review_field;
    IBOutlet NSTextFieldCell *title_field;
    IBOutlet NSTextFieldCell *rate_field;
    IBOutlet NSTextFieldCell *id_field;
    
    IBOutlet NSButton *edit_review_button;
    IBOutlet NSButton *delete_review_button;
    IBOutlet NSTextFieldCell *review_id_field;
}

@property (nonatomic, retain) DOUEngine *engine;
@property (nonatomic, retain) NSButton *get_button;
@property (nonatomic, retain) IBOutlet NSButton *review_button;
@property (nonatomic, retain) NSImageCell *pic_cell;
@property (nonatomic, retain) NSTextFieldCell *info_field;
@property (nonatomic, retain) IBOutlet NSProgressIndicator *progress;

@property (nonatomic, retain) IBOutlet NSTextFieldCell *review_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *title_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *rate_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *id_field;

@property (nonatomic, retain) IBOutlet NSButton *edit_review_button;
@property (nonatomic, retain) IBOutlet NSButton *delete_review_button;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *review_id_field;

- (IBAction)onGetClicked:(id)sender;
- (IBAction)onReviewButtonClicked:(id)sender;
- (IBAction)onEditReviewButtonClicked:(id)sender;
- (IBAction)onDeleteReviewButtonClicked:(id)sender;

@end
