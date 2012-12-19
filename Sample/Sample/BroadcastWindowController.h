//
//  BroadcastWindowController.h
//  Sample
//
//  Created by bettylwx's on 12-12-18.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <DoubanAPICocoa/DOUEngine.h>

@interface BroadcastWindowController : NSWindowController {
    DOUEngine *engine;
    
    IBOutlet NSTextFieldCell *shuo_field;
    IBOutlet NSButton *shuo_button;
    IBOutlet NSButton *image_button;
    IBOutlet NSTextFieldCell *info_field;
    IBOutlet NSProgressIndicator *progress;
    
    NSImage *image;
    NSData *image_data;
    
    IBOutlet NSTextFieldCell *get_shuo_field;
    IBOutlet NSButton *get_shuo_button;
    
    IBOutlet NSTextFieldCell *user_shuo_id_field;
    IBOutlet NSTextFieldCell *get_user_shuo_field;
    IBOutlet NSButton *get_user_shuo_button;
    
    IBOutlet NSTextFieldCell *user_shuo_id_field2;
    IBOutlet NSTextFieldCell *get_user_shuo_field2;
    IBOutlet NSButton *get_user_shuo_button2;
    
    IBOutlet NSTextFieldCell *user_shuo_id_field3;
    IBOutlet NSTextFieldCell *get_user_shuo_field3;
    IBOutlet NSButton *get_user_shuo_button3;
}

@property (nonatomic, retain) DOUEngine *engine;

@property (nonatomic, retain) IBOutlet NSTextFieldCell *shuo_field;
@property (nonatomic, retain) IBOutlet NSButton *shuo_button;
@property (nonatomic, retain) IBOutlet NSButton *image_button;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *info_field;
@property (nonatomic, retain) IBOutlet NSProgressIndicator *progress;
@property (nonatomic, retain) NSImage *image;
@property (nonatomic, retain) NSData *image_data;

@property (nonatomic, retain) IBOutlet NSTextFieldCell *get_shuo_field;
@property (nonatomic, retain) IBOutlet NSButton *get_shuo_button;

@property (nonatomic, retain) IBOutlet NSTextFieldCell *user_shuo_id_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *get_user_shuo_field;
@property (nonatomic, retain) IBOutlet NSButton *get_user_shuo_button;

@property (nonatomic, retain) IBOutlet NSTextFieldCell *user_shuo_id_field2;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *get_user_shuo_field2;
@property (nonatomic, retain) IBOutlet NSButton *get_user_shuo_button2;

@property (nonatomic, retain) IBOutlet NSTextFieldCell *user_shuo_id_field3;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *get_user_shuo_field3;
@property (nonatomic, retain) IBOutlet NSButton *get_user_shuo_button3;

- (IBAction)onShuoButtonClicked:(id)sender;
- (IBAction)openImageButtonClicked:(id)sender;
- (IBAction)onGetShuoButtonClicked:(id)sender;
- (IBAction)onGetUserShuoButtonClicked:(id)sender;
- (IBAction)onGetOneShuoButtonClicked:(id)sender;
- (IBAction)onDeleteOneShuoButtonClicked:(id)sender;
- (IBAction)onReshareButtonClicked:(id)sender;
- (IBAction)onLikeButtonClicked:(id)sender;
- (IBAction)onReshareUserButtonClicked:(id)sender;
- (IBAction)onLikeUserButtonClicked:(id)sender;
@end
