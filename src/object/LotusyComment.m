//
//  LotusyComment.m
//  LotusySDK
//
//  Created by indochino on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "LotusyComment.h"

@interface LotusyComment()

@property (nonatomic) int _commentId;
@property (nonatomic) int _businessId;
@property (nonatomic) int _userId;
@property (nonatomic, strong) LotusyLatLng* _location;
@property (nonatomic, strong) NSString* _message;
@property (nonatomic) int _likeCount;
@property (nonatomic) int _dislikeCount;
@property (nonatomic, strong) NSDate* _createTime;
@property (nonatomic) int _replyCount;
@property (nonatomic) BOOL _isDeleted;
@property (nonatomic, strong) NSArray* _imageUris;

@end

@implementation LotusyComment

- (id) initWithParam:(int)commentId
          businessId:(int)businessId
              userId:(int)userId
            location:(LotusyLatLng*)location
             message:(NSString*)message
           likeCount:(int)likeCount
        dislikeCount:(int)dislikeCount
          createTime:(int)createTime
          replyCount:(int)replyCount
             deleted:(BOOL)deleted
           imageUris:(NSArray*)imageUris {
    self._commentId = commentId;
    self._businessId = businessId;
    self._userId = userId;
    self._location = location;
    self._message = message;
    self._likeCount = likeCount;
    self._dislikeCount = dislikeCount;
    self._createTime = [[NSDate date] dateByAddingTimeInterval:-1*createTime];
    self._replyCount = replyCount;
    self._isDeleted = deleted;
    self._imageUris = imageUris;

    return self;
}

- (int) commentId { return self._commentId; }
- (int) businessId { return self._businessId; }
- (int) userId { return self._userId; }
- (LotusyLatLng*) location { return self._location; }
- (NSString*) message { return self._message; }
- (int) likeCount { return self._likeCount; }
- (int) dislikeCount { return self._dislikeCount; }
- (NSDate*) createTime { return self._createTime; }
- (int) replyCount { return self._replyCount; }
- (BOOL) isDeleted { return self._isDeleted; }
- (NSArray*) imageUris { return self._imageUris; }

@end
