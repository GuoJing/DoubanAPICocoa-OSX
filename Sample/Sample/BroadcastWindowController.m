//
//  BroadcastWindowController.m
//  Sample
//
//  Created by bettylwx's on 12-12-18.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "BroadcastWindowController.h"
#import "Consts.h"

#import <DoubanAPICocoa/DOUBrocastEngine.h>

@implementation BroadcastWindowController

@synthesize engine;
@synthesize shuo_button;
@synthesize shuo_field;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        self.engine = [[DOUEngine alloc] initWithApiKey:kAPIKey withSecretKey:kPrivateKey withRedirUrl:kRedirectUrl];
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
}

- (IBAction)onShuoButtonClicked:(id)sender {
    DOUBrocastEngine *s = [self.engine getEngine:kDOUBoardcast];
    [s SayWithSource:kAPIKey withText:self.shuo_field.title withImage:nil withRecTitle:@"该作者的博客" withRecUrl:@"http://www.guojing.me" withRecDesc:@"欢迎访问" successBlock:nil failedBlock:nil];
}

@end
