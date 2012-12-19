//
//  BroadcastWindowController.m
//  Sample
//
//  Created by bettylwx's on 12-12-18.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "BroadcastWindowController.h"
#import "Consts.h"

#import <DoubanAPICocoa/DOUBroadcastEngine.h>
#import <DoubanAPICocoa/DOUBroadcast.h>
#import <DoubanAPICocoa/DOUBroadcastArray.h>
#import <DoubanAPICocoa/DOUBroadcastLike.h>
#import <DoubanAPICocoa/DOUBroadcastReshare.h>
#import <DoubanAPICocoa/DOUBroadcastLikeArray.h>
#import <DoubanAPICocoa/DOUBroadcastReshareArray.h>

@implementation BroadcastWindowController

@synthesize engine;
@synthesize shuo_button;
@synthesize image_button;
@synthesize shuo_field;
@synthesize info_field;
@synthesize progress;
@synthesize image;
@synthesize image_data;
@synthesize get_shuo_button;
@synthesize get_shuo_field;

@synthesize user_shuo_id_field;
@synthesize get_user_shuo_field;
@synthesize get_user_shuo_button;

@synthesize user_shuo_id_field2;
@synthesize get_user_shuo_field2;
@synthesize get_user_shuo_button2;

@synthesize user_shuo_id_field3;
@synthesize get_user_shuo_field3;
@synthesize get_user_shuo_button3;

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
    self.image = nil;
    [[self progress] stopAnimation:self];
}

- (IBAction)onShuoButtonClicked:(id)sender {
    DOUBroadcastEngine *s = [self.engine getEngine:kDOUBroadcast];
    [[self progress] startAnimation:self];
    void(^successBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"成功!";
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        self.info_field.title = @"失败!";
        NSLog(@"Failed %@", e);
    };
    if (self.image_data) {
        [s say:self.shuo_field.title withImage:self.image_data successBlock:successBlock failedBlock:failBlock];
        self.image_data = nil;
    } else {
        [s say:self.shuo_field.title successBlock:successBlock failedBlock:failBlock];
    }
}

- (IBAction)openImageButtonClicked:(id)sender{
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    [openDlg setCanChooseFiles:YES];
    [openDlg setCanChooseDirectories:NO];
    NSArray *fileTypesArray;
    fileTypesArray = [NSArray arrayWithObjects:@"jpg", @"gif", @"png", nil];
    [openDlg setPrompt:NSLocalizedString(@"选择图片", nil)];
    [openDlg setAllowedFileTypes:fileTypesArray];
        
    if ([openDlg runModal] == NSOKButton) {
        NSURL* path = [[openDlg URLs] objectAtIndex:0];
        NSData *data = [[NSData alloc] initWithContentsOfURL:path];
        self.image_data = data;
    }
}

- (IBAction)onGetShuoButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    DOUBroadcastEngine *s = [self.engine getEngine:kDOUBroadcast];
    void(^successBlock)(DOUBroadcastArray *) = ^(DOUBroadcastArray *casts) {
        self.info_field.title = @"成功!";
        [[self progress] stopAnimation:self];
        DOUBroadcast *b = [[casts objectArray] objectAtIndex:0];
        self.get_shuo_field.title = b.title;
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        self.info_field.title = @"失败!";
        NSLog(@"Failed %@", e);
    };
    [s getHomeTimeLineStartWith:0 count:20 successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onGetUserShuoButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    DOUBroadcastEngine *s = [self.engine getEngine:kDOUBroadcast];
    void(^successBlock)(DOUBroadcastArray *) = ^(DOUBroadcastArray *casts) {
        self.info_field.title = @"成功!";
        [[self progress] stopAnimation:self];
        DOUBroadcast *b = [[casts objectArray] objectAtIndex:0];
            self.get_user_shuo_field.title = b.title;
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        self.info_field.title = @"失败!";
        NSLog(@"Failed %@", e);
    };
    [s getUserTimeLineWithUserID:self.user_shuo_id_field.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onGetOneShuoButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    DOUBroadcastEngine *s = [self.engine getEngine:kDOUBroadcast];
    void(^successBlock)(DOUBroadcast *) = ^(DOUBroadcast *b) {
        self.info_field.title = @"成功!";
        [[self progress] stopAnimation:self];
        self.get_user_shuo_field2.title = b.text;
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        self.info_field.title = @"失败!";
        NSLog(@"Failed %@", e);
    };
    [s getBroadCastWithRemoteID:self.user_shuo_id_field2.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onDeleteOneShuoButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    DOUBroadcastEngine *s = [self.engine getEngine:kDOUBroadcast];
    void(^successBlock)(NSString *) = ^(NSString *b) {
        self.info_field.title = @"成功!";
        [[self progress] stopAnimation:self];
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        self.info_field.title = @"失败!";
        NSLog(@"Failed %@", e);
    };
    [s deleteBroadCastWithRemoteID:self.user_shuo_id_field2.title successBlock:successBlock failedBlock:failBlock];
}

- (IBAction)onReshareButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    DOUBroadcastEngine *s = [self.engine getEngine:kDOUBroadcast];
    void(^successBlock)(NSString *) = ^(NSString *b) {
        self.info_field.title = @"成功!";
        [[self progress] stopAnimation:self];
    };
    [s reshareWithBroadCastID:self.user_shuo_id_field3.title successBlock:successBlock failedBlock:nil];
}

-(IBAction)onLikeButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    DOUBroadcastEngine *s = [self.engine getEngine:kDOUBroadcast];
    void(^successBlock)(NSString *) = ^(NSString *b) {
        self.info_field.title = @"成功!";
        [[self progress] stopAnimation:self];
    };
    [s likeWithBroadCastID:self.user_shuo_id_field3.title successBlock:successBlock failedBlock:nil];
}

- (IBAction)onReshareUserButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    DOUBroadcastEngine *s = [self.engine getEngine:kDOUBroadcast];
    void(^successBlock)(DOUBroadcastReshareArray *) = ^(DOUBroadcastReshareArray *b) {
        self.info_field.title = @"成功!";
        [[self progress] stopAnimation:self];
        DouBroadcastReshare *us = [[b objectArray] objectAtIndex:0];
        NSLog(@"%@", us.screen_name);
    };
    [s getResharersWithBroadCastID:self.user_shuo_id_field3.title successBlock:successBlock failedBlock:nil];
}

- (IBAction)onLikeUserButtonClicked:(id)sender{
    [[self progress] startAnimation:self];
    DOUBroadcastEngine *s = [self.engine getEngine:kDOUBroadcast];
    void(^successBlock)(DOUBroadcastLikeArray *) = ^(DOUBroadcastLikeArray *b) {
        self.info_field.title = @"成功!";
        [[self progress] stopAnimation:self];
        DOUBroadcastLike *us = [[b objectArray] objectAtIndex:0];
        NSLog(@"%@", us.screen_name);
    };
    [s getLikersWithBroadCastID:self.user_shuo_id_field3.title successBlock:successBlock failedBlock:nil];
}

@end
