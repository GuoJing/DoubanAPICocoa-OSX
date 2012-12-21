//
//  UserWindowController.m
//  Sample
//
//  Created by GuoJing on 12-12-19.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "UserWindowController.h"
#import "Consts.h"

#import <DoubanAPICocoa/DOUBroadcastUser.h>
#import <DoubanAPICocoa/DOUUserEngine.h>

@implementation UserWindowController

@synthesize follow_button;
@synthesize unfollow_button;
@synthesize block_button;
@synthesize engine;
@synthesize progress;
@synthesize info_field;
@synthesize uid_field;

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

- (IBAction)onFollowButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
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
    DOUUserEngine *u = [self.engine getEngine:kDOUUser];
    [u followSomeOneWithUserID:self.uid_field.title successBlock:successBlock failedBlock:failBlock];

}
- (IBAction)onUnFollowButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
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
    DOUUserEngine *u = [self.engine getEngine:kDOUUser];
    [u unfollowSomeOneWithUserID:self.uid_field.title successBlock:successBlock failedBlock:failBlock];

}
- (IBAction)onBlockButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
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
    DOUUserEngine *u = [self.engine getEngine:kDOUUser];
    [u blockSomeOneWithUserID:self.uid_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onGetUserClicked:(id)sender{
    [[self progress] startAnimation:self];
    DOUUserEngine *u = [self.engine getEngine:kDOUUser];
    void(^successBlock)(DOUBroadcastUserArray *) = ^(DOUBroadcastUserArray *us) {
        self.info_field.title = @"成功!";
        DOUBroadcastUser *u = [[us objectArray] objectAtIndex:0];
        NSLog(@"%@", u.screenName);
        [[self progress] stopAnimation:self];
    };
    void(^successUserBlock)(DOUUser *) = ^(DOUUser *u) {
        self.info_field.title = @"成功!";
        NSLog(@"name is %@", u.screenName);
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        NSLog(@"%@", e);
    };
    [u getUserFollowersWithUserID:self.uid_field.title successBlock:successBlock failedBlock:failBlock];
    [u getUserWithRemoteID:self.uid_field.title successBlock:successUserBlock failedBlock:failBlock];
}

@end
