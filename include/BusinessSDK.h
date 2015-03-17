//
//  BusinessSDK.h
//  LotusySDK
//
//  Created by pshen on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotusyLatLng.h"
#import "LotusyHours.h"
#import "LotusyAddress.h"
#import "LotusyBusiness.h"
#import "LotusyRating.h"
#import "LotusyRESTResult.h"

@interface BusinessSDK : NSObject

+ (void) createBusiness:(LotusyLatLng*)latlng
                 zhName:(NSString*)zhName
                 twName:(NSString*)twName
                 enName:(NSString*)enName
                  price:(NSString*)price
               cashOnly:(BOOL)cashOnly
               verified:(BOOL)verified
                  phone:(NSString*)phone
                website:(NSString*)website
                 social:(NSString*)social
                  hours:(LotusyHours*)hours
                address:(LotusyAddress*)address
               callback:(void(^)(LotusyRESTResult*, LotusyBusiness*))callback;


+ (void) businessProfile:(int)businessId
                callback:(void(^)(LotusyRESTResult*, LotusyBusiness*))callback;


+ (void) businessLocation:(LotusyLatLng*)latlng
                   radius:(int)radius
                  isMiles:(BOOL)isMiles
                    start:(int)start
                     size:(int)size
                 callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback;


+ (void) rateBusiness:(int)businessId
              overall:(double)overall
                 food:(double)food
          environment:(double)environment
              service:(double)service
             callback:(void(^)(LotusyRESTResult*))callback;


+ (void) userRating:(int)businessId
             userId:(int)userId
           callback:(void(^)(LotusyRESTResult*, LotusyRating*))callback;

@end
