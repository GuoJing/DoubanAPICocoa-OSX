//
//  EventWindowController.m
//  Sample
//
//  Created by GuoJing on 12-12-15.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "EventWindowController.h"

#import "Consts.h"

#import <DoubanAPICocoa/DOUConsts.h>
#import <DoubanAPICocoa/DOUEngine.h>
#import <DoubanAPICocoa/DOUEventEngine.h>
#import <DoubanAPICocoa/DOULocEngine.h>

#import <DoubanAPICocoa/DOUUserArray.h>

@implementation EventWindowController

@synthesize login_button;
@synthesize get_button;
@synthesize eid_field;
@synthesize pic_cell;
@synthesize info_field;
@synthesize engine;

@synthesize city_field;
@synthesize begin_time_field;
@synthesize end_time_field;
@synthesize address_field;
@synthesize einfo_field;
@synthesize progress;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        self.engine = [[DOUEngine alloc] initWithApiKey:kAPIKey withSecretKey:kPrivateKey withRedirUrl:kRedirectUrl];
        [[self progress] setDisplayedWhenStopped:YES];
    }
    
    return self;
}

- (void)OAuthClient:(DOUOAuthService *)client didAcquireSuccessDictionary:(NSDictionary *)dic {
    NSLog(@"成功!");
    self.login_button.title = @"已验证!";
}

- (void)OAuthClient:(DOUOAuthService *)client didFailWithError:(NSError *)error {
    NSLog(@"Fail!");
}

- (IBAction)onGetClicked:(id)sender {
    DOUEventEngine *event_engine = [self.engine getEngine:kDOUEvent];
    self.info_field.title = @"等待网络请求...";
    [self.progress startAnimation:self];
    
    void(^successBlock)(DOUEvent *) = ^(DOUEvent *event) {
        self.info_field.title = @"成功!";
        [self updateImageUI:event];
    };
    
    void(^failedBlock)(NSString *) = ^(NSString *e) {
        NSLog(@"%@", e);
    };
    
    [event_engine getEventWithRemoteID:self.eid_field.title successBlock:successBlock failedBlock:failedBlock];
}

- (void)updateImageUI:(DOUEvent *)event {
    DOULocEngine *loc_engine = [self.engine getEngine:kDOULoc];
    
    void(^successBlock)(DOULoc *) = ^(DOULoc *loc) {
        self.city_field.title = [loc name];
    };
    
    void(^failedBlock)(NSString *) = ^(NSString *e) {
        NSLog(@"%@", e);
    };
    
    [loc_engine getLocWithRemoteID:[event locId] successBlock:successBlock failedBlock:failedBlock];
    
    NSImage *post=nil;
    NSString *poster_url = [event image];
    NSURL *poster_image = [NSURL URLWithString:poster_url];
    NSData *poster_data = [NSData dataWithContentsOfURL:poster_image];
    if (poster_data) {
        post = [[NSImage alloc] initWithData:poster_data];
        [self.pic_cell setImage:post];
        self.info_field.title = @"成功!";
    } else {
        self.info_field.title = @"显示图片失败!";
    }
    self.begin_time_field.title = [event beginTimeStr];
    self.end_time_field.title = [event endTimeStr];
    self.address_field.title  = [event address];
    [self.einfo_field setString:[event content]];
    
    [self.progress stopAnimation:self];
}

- (void)awakeFromNib {
    if ([self.engine isServiceValid]) {
        self.info_field.title = @"已在豆瓣验证";
        self.login_button.title = @"已验证";
    }
    [[self progress] stopAnimation:self];
}

- (void)windowDidLoad
{
    [super windowDidLoad];
}


@end
