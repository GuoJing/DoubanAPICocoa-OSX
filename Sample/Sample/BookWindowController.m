//
//  BookWindowController.m
//  Sample
//
//  Created by GuoJing on 12-12-16.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "BookWindowController.h"

#import "Consts.h"
#import <DoubanAPICocoa/DOUEngine.h>
#import <DoubanAPICocoa/DOUConsts.h>
#import <DoubanAPICocoa/DOUBookEngine.h>

@implementation BookWindowController

@synthesize get_button;
@synthesize engine;
@synthesize pic_cell;
@synthesize info_field;
@synthesize progress;
@synthesize title_field;
@synthesize rate_field;

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

- (IBAction)onGetClicked:(id)sender{
    self.info_field.title = @"等待网络请求...";
    [[self progress] startAnimation:nil];
    void(^successBlock)(DOUBook *) = ^(DOUBook *book) {
        [[self progress] stopAnimation:self];
        NSImage *post=nil;
        NSString *poster_url = [book mediumImage];
        NSURL *poster_image = [NSURL URLWithString:poster_url];
        NSData *poster_data = [NSData dataWithContentsOfURL:poster_image];
        if (poster_data) {
            post = [[NSImage alloc] initWithData:poster_data];
            [self.pic_cell setImage:post];
            self.title_field.title = book.title;
            self.rate_field.title = book.average;
            self.info_field.title = @"成功!";
        } else {
            self.info_field.title = @"显示图片失败!";
        }
    };
    void(^failBlock)(NSString *) = ^(NSString *e) {
        [[self progress] stopAnimation:self];
        NSLog(@"Failed %@", e);
    };
    DOUBookEngine *book_engine = [self.engine getEngine:kDOUBook];
    [book_engine getBookWithRemoteID:@"11528350" successBlock:successBlock failedBlock:failBlock];
}

@end
