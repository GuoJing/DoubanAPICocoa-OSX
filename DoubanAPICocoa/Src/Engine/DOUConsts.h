//
//  DOUConsts.h
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-14.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import <Foundation/Foundation.h>

enum _EngineTypes {
    kDOUEvent,
    kDOULoc,
    kDOUAlbum,
    kDOUPhoto,
    kDOUComment,
    kDOUOnline,
    kDOUUser,
    kDOUBook,
    kDOUMovie,
    kDOUMusic,
    kDOUBroadcast,
    kDOUMail,
    kDOUNote,
    kDOUDiscussion
} typedef EngineTypes;

enum _RateRanks {
    ONE = 1,
    TWO = 2,
    THREE = 3,
    FOUR = 4,
    FIVE = 5
} typedef RateRanks;

extern NSString * const kDOUBookactionWish;
extern NSString * const kDOUBookactionReading;
extern NSString * const kDOUBookactionRead;
extern NSString * const kDOUPrivacyPrivate;
extern NSString * const kDOUPrivacyFriend;
extern NSString * const kDOUPrivacyPublic;

extern NSString * const kDOUTrue;
extern NSString * const kDOUFalse;

extern NSString * const kDOUOrderAsc;
extern NSString * const kDOUOrderDesc;