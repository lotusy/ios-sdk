//
//  CommentSDK.h
//  LotusySDK
//
//  Created by pshen on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotusyLatLng.h"
#import "LotusyRESTResult.h"


@interface CommentSDK : NSObject

+ (void) createComment:(LotusyLatLng*)latlng
            businessId:(int)businessId
               message:(NSString*)message
              callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback;

+ (void) comment:(int)commentId
        callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback;

+ (void) deleteComment:(int)commentId
              callback:(void(^)(LotusyRESTResult*))callback;

+ (void) likeComment:(int)commentId
            callback:(void(^)(LotusyRESTResult*))callback;

+ (void) dislikeComment:(int)commentId
               callback:(void(^)(LotusyRESTResult*))callback;

+ (void) userComments:(int)userId
                start:(int)start
                 size:(int)size
             callback:(void(^)(LotusyRESTResult*, NSArray*))callback;

+ (void) businessComments:(int)businessId
                    start:(int)start
                     size:(int)size
                 callback:(void(^)(LotusyRESTResult*, NSArray*))callback;

@end
