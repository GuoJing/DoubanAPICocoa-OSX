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
NSString * const kDOUEventParticipantsAPIUrl = @"/v2/event/%@/participants";
NSString * const kDOUEventWishersAPIurl = @"/v2/event/%@/wishers";
NSString * const kDOUUserEvents = @"/v2/event/user_created/%@";
NSString * const kDOUUserParticipantedEvents = @"/v2/event/user_participated/%@";
NSString * const kDOUUserWishedEvents = @"/v2/event/user_wished/%@";
NSString * const kDOUEventsList = @"/v2/event/list";

//Loc

NSString * const kDOULocAPIUrl = @"/v2/loc/%@";
NSString * const kDOULocListAPIUrl = @"/v2/loc/list";