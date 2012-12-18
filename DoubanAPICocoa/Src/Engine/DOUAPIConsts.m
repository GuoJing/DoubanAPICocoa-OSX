//
//  DOUApiConsts.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-13.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUAPIConsts.h"

//#TODO 书影音的获取用户所有的tag没有实现
//v2/xxx/user_tags/id

//Event

NSString * const kDOUEventAPIUrl = @"/v2/event/%@";
NSString * const kDOUEventParticipantsAPIUrl = @"/v2/event/%@/participants?start=%d&count=%d";
NSString * const kDOUEventWishersAPIUrl = @"/v2/event/%@/wishers?start=%d&count=%d";
NSString * const kDOUEventUserEventsAPIUrl = @"/v2/event/user_created/%@?start=%d&count=%d";
NSString * const kDOUEventParticipantedEventsAPIUrl = @"/v2/event/user_participated/%@?start=%d&count=%d";
NSString * const kDOUEventWishedEventsAPIUrl = @"/v2/event/user_wished/%@?start=%d&count=%d";
NSString * const kDOUEventsListAPIUrl = @"/v2/event/list";

NSString * const kDOUEventAttendEventAPIUrl = @"/v2/event/%@/participants";
NSString * const kDOUEventWishEventAPIUrl = @"/v2/event/%@/wishers";

//Loc

NSString * const kDOULocAPIUrl = @"/v2/loc/%@";
NSString * const kDOULocListAPIUrl = @"/v2/loc/list";

//Book

NSString * const kDOUBookAPIUrl = @"/v2/book/%@";
NSString * const kDOUBookWithISBNAPIUrl = @"/v2/book/isbn/%@";
NSString * const kDOUBookSearchAPIUrl = @"/v2/book/search?q=%@&start=%d&count=%d";
NSString * const kDOUBookTagsAPIUrl = @"/v2/book/%@/tags";
NSString * const kDOUBookUserAllTagsAPIUrl = @"/v2/book/user/%@/tags?start=%d&count=%d";
NSString * const kDOUBookUserAllCollectionsAPIUrl = @"/v2/book/user/%@/collections?start=%d&count=%d";
NSString * const kDOUBookCollectInfoAPIUrl = @"/v2/book/%@/collection";
NSString * const kDOUBookUserAnnotationAPIUrl = @"/v2/book/user/%@/annotations?start=%d&count=%d";
NSString * const kDOUBookAnnotationsAPIUrl = @"/v2/book/%@/annotations";
NSString * const kDOUBookAnnotationAPIUrl = @"/v2/book/annotation/%@";
NSString * const kDOUBookCollectBookAPIUrl = @"/v2/book/%@/collection";
NSString * const kDOUBookWriteAnnotationAPIUrl = @"/v2/book/%@/annotations";
NSString * const kDOUBookEditAnnotationAPIUrl = @"/v2/book/annotation/%@";
NSString * const kDOUBookWriteReviewAPIUrl = @"/v2/book/reviews";
NSString * const kDOUBookEditReviewAPIUrl = @"/v2/book/review/%@";

//Movie

NSString * const kDOUMovieAPIUrl = @"/v2/movie/%@";
NSString * const kDOUMovieWithIMDBAPIUrl = @"/v2/movie/imdb/%@";
NSString * const kDOUMovieSearchAPIUrl = @"/v2/movie/search?q=%@&start=%d&count=%d";
NSString * const kDOUMovieTagsAPIUrl = @"/v2/movie/%@/tags";
NSString * const kDOUMovieWriteReviewAPIUrl = @"/v2/movie/reviews";
NSString * const kDOUMovieEditReviewAPIUrl = @"/v2/movie/review/%@";

//Music

NSString * const kDOUMusicAPIUrl = @"/v2/music/%@";
NSString * const kDOUMusicSearchAPIUrl = @"/v2/music/search?q=%@&start=%d&count=%d";
NSString * const kDOUMusicTagsAPIUrl = @"/v2/music/%@/tags";
NSString * const kDOUMusicWriteReviewAPIUrl = @"/v2/music/reviews";
NSString * const kDOUMusicEditReviewAPIUrl = @"/v2/music/review/%@";
