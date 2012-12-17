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
    IBOutlet NSProgressIndicator *progress;
    DOUEngine *engine;
    
    IBOutlet NSTextFieldCell *title_field;
    IBOutlet NSTextFieldCell *rate_field;
    IBOutlet NSTextFieldCell *bid_field;
    
    IBOutlet NSButton *wish_button;
    IBOutlet NSButton *reading_button;
    IBOutlet NSButton *read_button;
    IBOutlet NSButton *delete_collect_button;
}

@property (nonatomic, retain) DOUEngine *engine;
@property (nonatomic, retain) NSButton *get_button;
@property (nonatomic, retain) NSImageCell *pic_cell;
@property (nonatomic, retain) NSTextFieldCell *info_field;
@property (nonatomic, retain) IBOutlet NSProgressIndicator *progress;

@property (nonatomic, retain) IBOutlet NSTextFieldCell *title_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *rate_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *bid_field;

@property (nonatomic, retain) IBOutlet NSButton *wish_button;
@property (nonatomic, retain) IBOutlet NSButton *reading_button;
@property (nonatomic, retain) IBOutlet NSButton *read_button;
@property (nonatomic, retain) IBOutlet NSButton *delete_collect_button;

- (IBAction)onGetClicked:(id)sender;

- (IBAction)onWishButtonClicked:(id)sender;
- (IBAction)onReadingButtonClicked:(id)sender;
- (IBAction)onReadButtonClicked:(id)sender;

- (IBAction)onDelteCollectButtonClicked:(id)sender;

@end
