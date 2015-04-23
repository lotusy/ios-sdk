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


+ (void) uploadDishImage:(int)dishId
                    file:(NSData*)file
                callback:(void(^)(LotusyRESTResult*))callback;


+ (void) dishImages:(int)dishId
              start:(int)start
               size:(int)size
           callback:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) uploadSignatureImage:(int)dishId
                         file:(NSData*)file
                     callback:(void(^)(LotusyRESTResult*))callback;


+ (void) userSignatureImages:(int)userId
                       start:(int)start
                        size:(int)size
                    callback:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) deleteUserSignature:(int)signatureId
                    callback:(void(^)(LotusyRESTResult*))callback;


+ (void) uploadUserImage:(NSData*)file
                callback:(void(^)(LotusyRESTResult*))callback;


+ (void) uploadBusinessImage:(int)businessId
                        file:(NSData*)file
                    callback:(void(^)(LotusyRESTResult*))callback;


@end
