//
//  DOUApiConsts.m
//  DoubanAPICocoa
//
//  Created by GuoJing on 12-12-13.
//  Copyright (c) 2012年 GuoJing. All rights reserved.
//

#import "DOUAPIConsts.h"

//#TODO 书影音的获取用户所有的tag没有实现，好像已经废弃
//#TODO 豆瓣广播里开放的block用户好像不能用，也不知道为什么
//#TODO 广播用户应该有一个更好的封装

//Event

NSString * const kDOUEventAPIUrl = @"/v2/event/%@";
NSString * const kDOUEventParticipantsAPIUrl = @"/v2/event/%@/participants?start=%d&count=%d";
NSString * const kDOUEventWishersAPIUrl = @"/v2/event/%@/wishers?start=%d&count=%d";
NSString * const kDOUEventUserEventsAPIUrl = @"/v2/event/user_created/%@?start=%d&count=%d";
NSString * const kDOUEventParticipantedEventsAPIUrl = @"/v2/event/user_participated/%@?start=%d&count=%d";
NSString * const kDOUEventWishedEventsAPIUrl = @"/v2/event/user_wished/%@?start=%d&count=%d";
NSString * const kDOUEventsListAPIUrl = @"/v2/event/list";
NSString * const kDOUEventPhotosAPIUrl = @"/v2/event/%@/photos";
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

//Broadcast
NSString * const kDOUWriteBroadcastAPIUrl = @"/shuo/v2/statuses/";
NSString * const kDOUBroadcastByFriendsAPIUrl = @"/shuo/v2/statuses/home_timeline?since_id=%@&until_id=%@&start=%d&count=%d";
NSString * const kDOUBroadcastByUserAPIUrl = @"/shuo/v2/statuses/user_timeline/%@?since_id=%@&until_id=%@";
NSString * const kDOUBroadcastShuoAPIUrl = @"/shuo/v2/statuses/%@";
NSString * const kDOUBroadcastCommentListAPIUrl = @"/shuo/v2/statuses/%@/comments?start=%d&count=%d";
NSString * const kDOUBroadcastCommentAPIUrl = @"/shuo/v2/statuses/comment/%@";
NSString * const kDOUBroadcastReshareAPIUrl = @"/shuo/v2/statuses/%@/reshare";
NSString * const kDOUBroadcastLikeAPIUrl = @"/shuo/v2/statuses/%@/like";

//Broadcast User
NSString * const kDOUBroadcastUserFollowingAPIUrl = @"/shuo/v2/users/%@/following";
NSString * const kDOUBroadcastUserFollowersAPIUrl = @"/shuo/v2/users/%@/followers";
NSString * const kDOUBroadcastUserFollowInCommonAPIUrl = @"/shuo/v2/users/%@/follow_in_common";
NSString * const kDOUBroadcastUserFollowingFollowersAPIUrl = @"/shuo/v2/users/%@/following_followers_of";
NSString * const kDOUBroadcastUserSearchAPIUrl = @"/shuo/v2/users/search?q=%@";
NSString * const kDOUBroadcastUserBlockAPIUrl = @"/shuo/v2/users/%@/block";
NSString * const kDOUBroadcastUserFollowAPIUrl = @"/shuo/v2/friendships/create";
NSString * const kDOUBroadcastUserUnFollowAPIUrl = @"/shuo/v2/friendships/destroy";
NSString * const kDOUBroadcastUserFriendShopAPIurl = @"/shuo/v2/friendships/show?source=%@&source_id=%@&target_id=%@";

//User
NSString * const kDOUUserMeAPIUrl = @"/v2/user/~me";
NSString * const kDOUUserAPIUrl = @"/v2/user/%@";

//Doumail
NSString * const kDOUMailAPIUrl = @"/v2/doumail/%@";
NSString * const kDOUMailInboxAPIUrl = @"/v2/doumail/inbox";
NSString * const kDOUMailOutboxAPIUrl = @"/v2/doumail/outbox";
NSString * const kDOUMailUnreadAPIUrl = @"/v2/doumail/inbox/unread";

NSString * const kDOUMailWriteMailAPIUrl = @"/v2/doumails";
NSString * const kDOUMailMarkMailAPIUrl = @"/v2/doumail/%@";
NSString * const kDOUMailMarkMultiMailAPIUrl = @"/v2/doumail/read";
NSString * const kDOUMailDeleteMailAPIUrl = @"/v2/doumail/%@";
NSString * const kDOUMailDeleteMultiMailAPIUrl = @"/v2/doumail/delete";

//Note

NSString * const kDOUNoteWriteNoteAPIUrl = @"/v2/notes";
NSString * const kDOUNoteAPIUrl = @"/v2/note/%@";
NSString * const kDOUNoteCommentsAPIUrl = @"/v2/note/%@/comments";
NSString * const kDOUNoteLikeAPIUrl = @"/v2/note/%@/like";
NSString * const kDOUNoteUserNotesAPIUrl = @"/v2/note/user_created/%@";
NSString * const kDOUNoteUserLikedNotesAPIUrl = @"/v2/note/user_liked/%@";

//Discussion
NSString * const kDOUDiscussionAPIUrl = @"/v2/discussion/%@";
NSString * const kDOUDiscussionsAPIUrl = @"/v2/%@/%@/discussions";

//Comment
NSString * const kDOUCommentAPIUrl = @"/v2/%@/%@/comment/%@";
NSString * const kDOUCommentsAPIUrl = @"/v2/%@/%@/comments";

//Album
NSString * const kDOUAlbumAPIUrl = @"/v2/album/%@";
NSString * const kDOUAlbumPhotosAPIUrl = @"/v2/album/%@/photos";
NSString * const kDOUAlbumCreateAlbumAPIUrl = @"/v2/albums";
NSString * const kDOUAlbumUpdateAlbumAPIUrl = @"/v2/album/%@";
NSString * const kDOUAlbumLikeAPIUrl = @"/v2/album/%@/like";
NSString * const kDOUAlbumUserAlbumsAPIUrl = @"/v2/album/user_created/%@";
NSString * const kDOUAlbumUserLikedAlbumsAPIUrl = @"/v2/album/user_liked/&@";

//Photo
NSString * const kDOUPhotoAPIUrl = @"/v2/photo/%@";
NSString * const kDOUPhotoLikeAPIUrl = @"/v2/photo/%@/like";

NSString * const kDOUOnlineAPIUrl = @"//v2/online/%@";
NSString * const kDOUOnlineParticipantsAPIUrl = @"/v2/online/%@/participants?start=%@&count=%@";
NSString * const kDOUOnlinesAPIUrl = @"/v2/onlines";
NSString * const kDOUOnlineUpdateOnlineAPIUrl = @"/v2/online/%@";
NSString * const kDOUOnlineJoinOnlineAPIUrl = @"/v2/online/%@/participants";
NSString * const kDOUOnlineLikeOnlineAPIUrl = @"/v2/online/%@/like";
NSString * const kDOUOnlinePhotosAPIUrl = @"/v2/online/%@/photos";
NSString * const kDOUOnlineUserOnlinesAPIUrl = @"/v2/online/user_participated/%@";
NSString * const kDOUOnlineUserLikedOnlinesAPIUrl = @"/v2/online/user_created/%@";
