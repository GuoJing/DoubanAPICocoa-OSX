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
#import <DoubanAPICocoa/DOUQuery.h>
#import <DoubanAPICocoa/DOUEvent.h>
#import <DoubanAPICocoa/DOUEventArray.h>

static NSString * const kAPIKey = @"03c410cd0bc4fe1b0b4c3267234efa51";
static NSString * const kPrivateKey = @"af0ec50edbaf217e";
static NSString * const kRedirectUrl = @"http://guojing.me/release/doubanapicocoa/";

@implementation MainWindowController

@synthesize login_button;
@synthesize get_button;
@synthesize eid_field;
@synthesize pic_cell;
@synthesize info_field;

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
    self.login_button.title = @"Connected!";
}

- (void)OAuthClient:(DOUOAuthService *)client didFailWithError:(NSError *)error {
    NSLog(@"Fail!");
}

- (IBAction)onGetClicked:(id)sender {
    DOUService *service = [DOUService sharedInstance];
    
    //need to use https here
    service.apiBaseUrlString = kHttpsApiBaseUrl;
    
    NSString *subPath = [NSString stringWithFormat:@"/v2/event/%@", self.eid_field.title];
    //NSLog(@"%@", self.eid_field.title);
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:subPath parameters:nil];

    __block DOUEvent *event = nil;
    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUEventArray *array = [[DOUEventArray alloc] initWithString:[req responseString]];
            
            if (array) {
                event = [[DOUEvent alloc] initWithString:[req responseString]];
                NSLog(@"Get event success");
                
                
                NSLog(@"%@", [event endTime]);
                
                NSImage *post=nil;
                NSString *poster_url = [event image];
                
                NSLog(@"%@", poster_url);
                
                NSURL *poster_image = [NSURL URLWithString:poster_url];
                NSData *poster_data = [NSData dataWithContentsOfURL:poster_image];
                if (poster_data) {
                    post = [[NSImage alloc] initWithData:poster_data];
                    [self.pic_cell setImage:post];
                }
            } else {
                NSLog(@"Get event failed");
            }
        }
    };
    
    [service get:query callback:completionBlock];
}

- (IBAction)onLoginClicked:(id)sender {
    DOUService *service = [DOUService sharedInstance];
    if ([service isValid]) {
        self.info_field.title = @"Connected";
        self.login_button.title = @"Connected";
    } else {
        NSString *url_str = [NSString stringWithFormat:@"https://loc-zeta.douban.com/service/auth2/auth?client_id=%@&redirect_uri=%@&response_type=code", kAPIKey, kRedirectUrl];
        NSURL *login_url = [NSURL URLWithString:url_str];
        if ([[NSWorkspace sharedWorkspace] openURL:login_url])
            NSLog(@"Opened successfully.");
        else
            NSLog(@"Failed to open URL.");
    }
}

- (void)awakeFromNib {
    DOUService *service = [DOUService sharedInstance];
    if ([service isValid]) {
        self.info_field.title = @"Is Connected to douban";
        self.login_button.title = @"Connected";
    }
}

- (void)windowDidLoad
{
    [super windowDidLoad];
}

@end
