//
//  UserWindowController.h
//  Sample
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DoubanAPICocoa/DOUEngine.h>

@interface UserWindowController : NSWindowController {
    IBOutlet NSButton *follow_button;
    IBOutlet NSButton *unfollow_button;
    IBOutlet NSButton *block_button;
    IBOutlet NSTextFieldCell *uid_field;
    DOUEngine *engine;
    IBOutlet NSTextFieldCell *info_field;
    IBOutlet NSProgressIndicator *progress;
}

@property (nonatomic, retain) DOUEngine *engine;
@property (nonatomic, retain) IBOutlet NSButton *follow_button;
@property (nonatomic, retain) IBOutlet NSButton *unfollow_button;
@property (nonatomic, retain) IBOutlet NSButton *block_button;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *uid_field;
@property (nonatomic, retain) IBOutlet NSTextFieldCell *info_field;
@property (nonatomic, retain) IBOutlet NSProgressIndicator *progress;

- (IBAction)onFollowButtonClicked:(id)sender;
- (IBAction)onUnFollowButtonClicked:(id)sender;
- (IBAction)onBlockButtonClicked:(id)sender;
- (IBAction)onGetUserClicked:(id)sender;

@end
