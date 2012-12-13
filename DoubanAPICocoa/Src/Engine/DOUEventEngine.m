//
//  DOUEventEngine.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-13.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUEventEngine.h"

#import "DOUEvent.h"
#import "DOUEventArray.h"
#import "DOUService.h"
#import "DOUApiConsts.h"
#import "DOUQuery.h"

@implementation DOUEventEngine

- (DOUEvent *)initWithRemoteID:(NSString *)event_id {
    __block DOUEvent *event = nil;
    if(![self isServiceValid]) {
        return nil;
    }

    DOUService *service = [self getService];
    NSString *apiUrl = [NSString stringWithFormat:kDOUEventAPI, event_id];
    DOUQuery *query = [[DOUQuery alloc] initWithSubPath:apiUrl parameters:nil];

    DOUReqBlock completionBlock = ^(DOUHttpRequest *req){
        NSError *error = [req doubanError];
        if (!error) {
            DOUEventArray *array = [[DOUEventArray alloc] initWithString:[req responseString]];
            if (array) {
                event = [[DOUEvent alloc] initWithString:[req responseString]];
            }
        }
    };
    [service get:query callback:completionBlock];
    return event;
}

@end
