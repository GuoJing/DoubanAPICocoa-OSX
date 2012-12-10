//
//  MainWindowController.h
//  Sample
//
//  Created by GuoJing on 12-12-10.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainWindowController : NSWindowController {
    IBOutlet NSButton *login_button;
}

@property (nonatomic, retain) NSButton *login_button;

@end
