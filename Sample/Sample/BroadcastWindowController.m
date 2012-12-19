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
@synthesize image_button;
@synthesize shuo_field;
@synthesize info_field;
@synthesize progress;
@synthesize image;
@synthesize image_data;

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
    if (self.image_data) {
        [s SayWithImage:self.shuo_field.title withImage:self.image_data successBlock:successBlock failedBlock:failBlock];
        self.image_data = nil;
    } else {
        [s Say:self.shuo_field.title successBlock:successBlock failedBlock:failBlock];
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

@end
