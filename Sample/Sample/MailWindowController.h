//
//  MailWindowController.h
//  Sample
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DoubanAPICocoa/DOUEngine.h>

@interface MailWindowController : NSWindowController {
    IBOutlet NSButton *get_button;
    IBOutlet NSButton *write_button;
    IBOutlet NSButton *mark_button;
    IBOutlet NSButton *delete_button;
    IBOutlet NSTextFieldCell *did_field;
    IBOutlet NSTextFieldCell *did_content_field;
    IBOutlet NSTextFieldCell *did_receive_id_field;
    IBOutlet NSTextFieldCell *did_write_field;
    IBOutlet NSTextFieldCell *uid_ops_field;
    DOUEngine *engine;
    IBOutlet NSTextFieldCell *info_field;
    IBOutlet NSProgressIndicator *progress;
}

@property (nonatomic, retain) IBOutlet NSButton *get_button;
@property (nonatomic, retain) IBOutlet NSButton *write_button;
@property (nonatomic, retain) IBOutlet NSButton *mark_button;
@property (nonatomic, retain) IBOutlet NSButton *delete_button;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *did_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *did_content_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *did_receive_id_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *did_write_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *uid_ops_field;
@property (nonatomic, retain) DOUEngine *engine;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *info_field;
@property (nonatomic, retain) IBOutlet NSProgressIndicator *progress;

- (IBAction)onGetMailButtonClicked:(id)sender;
- (IBAction)onWriteMailButtonClicked:(id)sender;
- (IBAction)onMarkMailButtonClicked:(id)sender;
- (IBAction)onDeleteMailButtonClicked:(id)sender;

@end
