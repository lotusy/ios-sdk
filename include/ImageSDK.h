//
//  ImageSDK.h
//  LotusySDK
//
//  Created by pshen on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotusyRESTResult.h"

@interface ImageSDK : NSObject

+ (void) commentImages:(int)commentId
                 start:(int)start
                  size:(int)size
              callback:(void(^)(LotusyRESTResult*, NSArray*))callback;

+ (void) businessCommentImages:(int)businessId
                         start:(int)start
                          size:(int)size
                      callback:(void(^)(LotusyRESTResult*, NSArray*))callback;

+ (void) userCommentImages:(int)userId
                     start:(int)start
                      size:(int)size
                  callback:(void(^)(LotusyRESTResult*, NSArray*))callback;

+ (void) uploadCommentImage:(int)commentId
                       file:(NSData*)file
                   callback:(void(^)(LotusyRESTResult*))callback;

+ (void) uploadBusinessProfileImage:(int)businessId
                               file:(NSData*)file
                           callback:(void(^)(LotusyRESTResult*))callback;

+ (void) uploadUserProfileImage:(NSData*)file
                       callback:(void(^)(LotusyRESTResult*))callback;

@end
