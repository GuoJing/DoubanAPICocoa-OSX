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
@synthesize info_field;
@synthesize progress;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        self.engine = [[DOUEngine alloc] initWithApiKey:kAPIKey withSecretKey:kPrivateKey withRedirUrl:kRedirectUrl];
    }
    
    return self;
}

- (void)awakeFromNib {
    if ([self.engine isServiceValid]) {
        self.info_field.title = @"已在豆瓣验证";
    }
    [[self progress] stopAnimation:self];
}

- (IBAction)onShuoButtonClicked:(id)sender {
    DOUBrocastEngine *s = [self.engine getEngine:kDOUBoardcast];
    [[self progress] startAnimation:self];
    void(^successBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"成功!";
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        self.info_field.title = @"失败!";
        NSLog(@"Failed %@", e);
    };
    [s SayWithSource:kAPIKey withText:self.shuo_field.title withImage:nil withRecTitle:@"该作者的博客" withRecUrl:@"http://www.guojing.me" withRecDesc:@"欢迎访问" successBlock:successBlock failedBlock:failBlock];
}

@end
