//
//  MailWindowController.m
//  Sample
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "MailWindowController.h"
#import "Consts.h"
#import <DoubanAPICocoa/DOUMail.h>
#import <DoubanAPICocoa/DOUMailArray.h>
#import <DoubanAPICocoa/DOUMailEngine.h>

@implementation MailWindowController

@synthesize get_button;
@synthesize write_button;
@synthesize mark_button;
@synthesize delete_button;
@synthesize did_field;
@synthesize did_content_field;
@synthesize did_write_field;
@synthesize uid_ops_field;
@synthesize engine;
@synthesize info_field;
@synthesize progress;
@synthesize did_receive_id_field;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        self.engine = [[DOUEngine alloc] initWithApiKey:kAPIKey withSecretKey:kPrivateKey withRedirUrl:kRedirectUrl];
        [[self progress] setDisplayedWhenStopped:YES];
    }
    
    return self;
}

- (void)awakeFromNib {
    if ([self.engine isServiceValid]) {
        self.info_field.title = @"已在豆瓣验证";
    }
    [[self progress] stopAnimation:self];
}

- (IBAction)onGetMailButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    DOUMailEngine *e = [self.engine getEngine:kDOUMail];
    void(^successBlock)(DOUMail *) = ^(DOUMail *m) {
        self.info_field.title = @"成功!";
        [[self progress] stopAnimation:self];
        self.did_content_field.title = [m content];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        NSLog(@"%@", e);
    };
    [e getDoumailWithRemoteID:self.did_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onWriteMailButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    DOUMailEngine *e = [self.engine getEngine:kDOUMail];
    void(^successBlock)(NSString *) = ^(NSString *b) {
        self.info_field.title = @"成功!";
        NSLog(@"%@", b);
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        NSLog(@"%@", e);
    };
    [e sendDoumailWithTitle:@"测试豆邮" withContent:self.did_write_field.title withReceiverID:self.did_receive_id_field.title withCaptchaToken:@"" withCaptchaString:@"" successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onMarkMailButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    DOUMailEngine *e = [self.engine getEngine:kDOUMail];
    void(^successBlock)(NSString *) = ^(NSString *b) {
        self.info_field.title = @"成功!";
        NSLog(@"%@", b);
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        NSLog(@"%@", e);
    };
    [e markAsReadWithID:self.uid_ops_field.title successBlock:successBlock failedBlock:failBlock];

}

- (IBAction)onDeleteMailButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    DOUMailEngine *e = [self.engine getEngine:kDOUMail];
    void(^successBlock)(NSString *) = ^(NSString *b) {
        self.info_field.title = @"成功!";
        NSLog(@"%@", b);
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        NSLog(@"%@", e);
    };
    [e deleteDoumailWithID:self.uid_ops_field.title successBlock:successBlock failedBlock:failBlock];
}

@end
