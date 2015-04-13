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
#import "LotusyRESTResult.h"

@interface BusinessSDK : NSObject

+ (void) createBusiness:(LotusyLatLng*)location
                 zhName:(NSString*)zhName
                 twName:(NSString*)twName
                 enName:(NSString*)enName
                  price:(NSString*)price
               category:(NSString*)category
               cashOnly:(BOOL)cashOnly
               verified:(BOOL)verified
                  phone:(NSString*)phone
                website:(NSString*)website
                 social:(NSString*)social
                  hours:(LotusyHours*)hours
                address:(LotusyAddress*)address
               callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback;


+ (void) createSimpleBusiness:(LotusyLatLng*)location
                       zhName:(NSString*)zhName
                       twName:(NSString*)twName
                       enName:(NSString*)enName
                     category:(NSString*)category
                     callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback;


+ (void) businessProfile:(int)businessId
                callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback;


+ (void) businessLocation:(LotusyLatLng*)latlng
                   radius:(int)radius
                  isMiles:(BOOL)isMiles
                    start:(int)start
                     size:(int)size
                 callback:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) businessNameSearch:(NSString*)name
                   callback:(void(^)(LotusyRESTResult*, NSArray*))callback;

@end
