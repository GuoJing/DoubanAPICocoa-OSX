//
//  MainWindowController.m
//  Sample
//
//  Created by GuoJing on 12-12-10.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "MainWindowController.h"
#import "Consts.h"

@implementation MainWindowController

@synthesize login_button;
@synthesize engine;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(getUrl:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
        self.engine = [[DOUEngine alloc] initWithApiKey:kAPIKey withSecretKey:kPrivateKey withRedirUrl:kRedirectUrl];
    }
    
    return self;
}

- (void)getUrl:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent
{
    NSURL *call_backurl = [NSURL URLWithString:[[event paramDescriptorForKeyword:keyDirectObject] stringValue]];
    NSString* query = [call_backurl query];
    NSLog(@"query is %@", query);
    NSArray *qs = [query componentsSeparatedByString:@"="];
    NSString *code = nil;
    NSInteger index = [qs indexOfObject:@"code"];
    index = index + 1;
    if (index != NSNotFound) {
        code = [qs objectAtIndex:index];
    }
    NSLog(@"code is %@", code);
    
    [self.engine didLoadWithCode:code];
    self.login_button.title = @"已连接到豆瓣";
}

- (IBAction)onLoginClicked:(id)sender {
    //if ([self.engine isServiceValid]) {
    //    self.login_button.title = @"已连接到豆瓣";
    //} else {
        NSString *url_str = [self.engine getConnectUrl];
        NSURL *login_url = [NSURL URLWithString:url_str];
        if ([[NSWorkspace sharedWorkspace] openURL:login_url])
            NSLog(@"Opened successfully.");
        else
            NSLog(@"Failed to open URL.");
    //}
}

- (void)awakeFromNib {
    if ([self.engine isServiceValid]) {
        self.login_button.title = @"已连接到豆瓣";
    }
}

@end
