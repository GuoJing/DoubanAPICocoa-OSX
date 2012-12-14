//
//  MainWindowController.h
//  Sample
//
//  Created by GuoJing on 12-12-10.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <DoubanAPICocoa/DOUEngine.h>

@interface MainWindowController : NSWindowController {
    IBOutlet NSButton *login_button;
    IBOutlet NSButton *get_button;
    IBOutlet NSTextFieldCell *eid_field;
    IBOutlet NSImageCell *pic_cell;    
    IBOutlet NSTextFieldCell *info_field;
    
    DOUEngine *engine;
}

@property (nonatomic, retain) NSButton *login_button;
@property (nonatomic, retain) NSButton *get_button;
@property (nonatomic, retain) NSTextFieldCell *eid_field;
@property (nonatomic, retain) NSImageCell *pic_cell;
@property (nonatomic, retain) NSTextFieldCell *info_field;
@property (nonatomic, retain) DOUEngine *engine;

- (IBAction)onGetClicked:(id)sender;
- (IBAction)onLoginClicked:(id)sender;
@end
