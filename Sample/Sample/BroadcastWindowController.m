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
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        self.info_field.title = @"失败!";
        NSLog(@"Failed %@", e);
    };
    if (self.image_data) {
        [s sayWithImage:self.shuo_field.title withImage:self.image_data successBlock:successBlock failedBlock:failBlock];
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
        self.get_shuo_field.title = b.user_name;
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        self.info_field.title = @"失败!";
        [[self progress] stopAnimation:self];
        self.info_field.title = @"失败!";
        NSLog(@"Failed %@", e);
    };
    [s getHomeTimeLine:successBlock failedBlock:failBlock];
}

@end
