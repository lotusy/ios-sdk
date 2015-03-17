//
//  LotusyComment.h
//  LotusySDK
//
//  Created by indochino on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotusyLatLng.h"

@interface LotusyComment : NSObject

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
           imageUris:(NSArray*)imageUris;

- (int) commentId;
- (int) businessId;
- (int) userId;
- (LotusyLatLng*) location;
- (NSString*) message;
- (int) likeCount;
- (int) dislikeCount;
- (NSDate*) createTime;
- (int) replyCount;
- (BOOL) isDeleted;
- (NSArray*) imageUris;

@end
