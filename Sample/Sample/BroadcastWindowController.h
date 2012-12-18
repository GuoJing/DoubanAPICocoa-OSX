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
}

@property (nonatomic, retain) DOUEngine *engine;

@property (nonatomic, retain) IBOutlet NSTextFieldCell *shuo_field;
@property (nonatomic, retain) IBOutlet NSButton *shuo_button;

- (IBAction)onShuoButtonClicked:(id)sender;

@end
