//
//  EventWindowController.h
//  Sample
//
//  Created by GuoJing on 12-12-15.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <DoubanAPICocoa/DOUEngine.h>

@interface EventWindowController : NSWindowController {
    IBOutlet NSButton *get_button;
    IBOutlet NSTextFieldCell *eid_field;
    IBOutlet NSImageCell *pic_cell;
    IBOutlet NSTextFieldCell *info_field;
    
    DOUEngine *engine;
    
    IBOutlet NSTextFieldCell *city_field;
    IBOutlet NSTextFieldCell *begin_time_field;
    IBOutlet NSTextFieldCell *end_time_field;
    IBOutlet NSTextFieldCell *address_field;
    IBOutlet NSTextView *einfo_field;
    
    IBOutlet NSProgressIndicator *progress;
}

@property (nonatomic, retain) NSButton *login_button;
@property (nonatomic, retain) NSButton *get_button;
@property (nonatomic, retain) NSTextFieldCell *eid_field;
@property (nonatomic, retain) NSImageCell *pic_cell;
@property (nonatomic, retain) NSTextFieldCell *info_field;
@property (nonatomic, retain) DOUEngine *engine;

@property (nonatomic, retain) IBOutlet NSTextFieldCell *city_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *begin_time_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *end_time_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *address_field;
@property (nonatomic, retain) IBOutlet NSTextView *einfo_field;
@property (nonatomic, retain) IBOutlet NSProgressIndicator *progress;

- (IBAction)onGetClicked:(id)sender;

@end
