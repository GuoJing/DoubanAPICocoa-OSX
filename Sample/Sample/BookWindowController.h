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
}

@property (nonatomic, retain) DOUEngine *engine;
@property (nonatomic, retain) NSButton *get_button;
@property (nonatomic, retain) NSImageCell *pic_cell;
@property (nonatomic, retain) NSTextFieldCell *info_field;
@property (nonatomic, retain) IBOutlet NSProgressIndicator *progress;

@property (nonatomic, retain) IBOutlet NSTextFieldCell *title_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *rate_field;

- (IBAction)onGetClicked:(id)sender;

@end
