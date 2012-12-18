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
}

@property (nonatomic, retain) DOUEngine *engine;

@property (nonatomic, retain) IBOutlet NSTextFieldCell *shuo_field;
@property (nonatomic, retain) IBOutlet NSButton *shuo_button;
@property (nonatomic, retain) IBOutlet NSButton *image_button;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *info_field;
@property (nonatomic, retain) IBOutlet NSProgressIndicator *progress;
@property (nonatomic, retain) NSImage *image;

- (IBAction)onShuoButtonClicked:(id)sender;
- (IBAction)openImageButtonClicked:(id)sender;

@end
