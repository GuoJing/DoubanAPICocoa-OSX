//
//  DOUApiConsts.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-13.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUAPIConsts.h"

//Event

NSString * const kDOUEventAPIUrl = @"/v2/event/%@";
NSString * const kDOUEventParticipantsAPIUrl = @"/v2/event/%@/participants?start=%d&count=%d";
NSString * const kDOUEventWishersAPIUrl = @"/v2/event/%@/wishers?start=%d&count=%d";
NSString * const kDOUUserEventsAPIUrl = @"/v2/event/user_created/%@?start=%d&count=%d";
NSString * const kDOUUserParticipantedEventsAPIUrl = @"/v2/event/user_participated/%@?start=%d&count=%d";
NSString * const kDOUUserWishedEventsAPIUrl = @"/v2/event/user_wished/%@?start=%d&count=%d";
NSString * const kDOUEventsListAPIUrl = @"/v2/event/list";

NSString * const kDOUAttendEventAPIUrl = @"/v2/event/%@/participants";
NSString * const kDOUWishEventAPIUrl = @"/v2/event/%@/wishers";

//Loc

NSString * const kDOULocAPIUrl = @"/v2/loc/%@";
NSString * const kDOULocListAPIUrl = @"/v2/loc/list";