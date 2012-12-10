//
//  MainWindowController.m
//  Sample
//
//  Created by GuoJing on 12-12-10.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "MainWindowController.h"
#import <DoubanAPICocoa/DOUOAuthService.h>
#import <DoubanAPICocoa/DOUAPIConfig.h>

static NSString * const kAPIKey = @"03c410cd0bc4fe1b0b4c3267234efa51";
static NSString * const kPrivateKey = @"af0ec50edbaf217e";
static NSString * const kRedirectUrl = @"http://guojing.me/release/doubanapicocoa/";

@implementation MainWindowController

@synthesize login_button;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(getUrl:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
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
    
    DOUOAuthService *service = [DOUOAuthService sharedInstance];
    service.authorizationURL = kTokenUrl;
    service.delegate = (id)self;
    service.clientId = kAPIKey;
    service.clientSecret = kPrivateKey;
    service.callbackURL = kRedirectUrl;
    service.authorizationCode = code;
    
    [service validateAuthorizationCode];
}

- (void)OAuthClient:(DOUOAuthService *)client didAcquireSuccessDictionary:(NSDictionary *)dic {
    NSLog(@"success!");
    self.login_button.title = @"Login success!";
}

- (void)OAuthClient:(DOUOAuthService *)client didFailWithError:(NSError *)error {
    NSLog(@"Fail!");
}

- (IBAction)onLoginClicked:(id)sender {
    NSString *url_str = [NSString stringWithFormat:@"https://www.douban.com/service/auth2/auth?client_id=%@&redirect_uri=%@&response_type=code", kAPIKey, kRedirectUrl];
    NSURL *login_url = [NSURL URLWithString:url_str];
    if ([[NSWorkspace sharedWorkspace] openURL:login_url])
        NSLog(@"Opened successfully.");
    else
        NSLog(@"Failed to open URL.");
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end
