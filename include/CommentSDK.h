//
//  CommentSDK.h
//  LotusySDK
//
//  Created by pshen on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotusyLatLng.h"
#import "LotusyComment.h"
#import "LotusyReply.h"
#import "LotusyRESTResult.h"


@interface CommentSDK : NSObject

+ (void) createComment:(LotusyLatLng*)latlng
            businessId:(int)businessId
               message:(NSString*)message
              callback:(void(^)(LotusyRESTResult*, LotusyComment*))callback;

+ (void) comment:(int)commentId
        callback:(void(^)(LotusyRESTResult*, LotusyComment*))callback;

+ (void) deleteComment:(int)commentId
              callback:(void(^)(LotusyRESTResult*))callback;

+ (void) likeComment:(int)commentId
            callback:(void(^)(LotusyRESTResult*))callback;

+ (void) dislikeComment:(int)commentId
               callback:(void(^)(LotusyRESTResult*))callback;

+ (void) commentLocation:(LotusyLatLng*)latlng
                  radius:(int)radius
                 isMiles:(BOOL)isMiles
                   start:(int)start
                    size:(int)size
                callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback;

+ (void) userComments:(int)userId
                start:(int)start
                 size:(int)size
             callback:(void(^)(LotusyRESTResult*, NSArray*))callback;

+ (void) businessComments:(int)businessId
                    start:(int)start
                     size:(int)size
                 callback:(void(^)(LotusyRESTResult*, NSArray*))callback;

+ (void) createReply:(int)commentId
             message:(NSString*)message
            callback:(void(^)(LotusyRESTResult*, LotusyReply*))callback;

+ (void) commentReplies:(int)commentId
                  start:(int)start
                   size:(int)size
               callback:(void(^)(LotusyRESTResult*, NSArray*))callback;

@end
