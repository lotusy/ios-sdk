//
//  PageSDK.h
//  LotusySDK
//
//  Created by Indochino on 2015-03-30.
//  Copyright (c) 2015 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotusyRESTResult.h"


@interface PageSDK : NSObject


+ (void) UC001_getBusinessDishes:(int)businessId
                           start:(int)start
                            size:(int)size
                        callback:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) UC001_getDishDetails:(int)dishId
                     callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback;


+ (void) UC002_getBuddiesDishActivities:(int)start
                                   size:(int)size
                               callback:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) UC002_getNearByFoods:(double)lat
                          lng:(double)lng
                        start:(int)start
                         size:(int)size
                     callback:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) UC002_getDishPopularity:(int)dishId
                        callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback;


+ (void) UC003_getDishPreference:(int)dishId
                           start:(int)start
                            size:(int)size
                        callback:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) UC003_getDishInfograph:(int)dishId
                       callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback;


+ (void) UC004_getBuddiesActivities:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) UC004_getMyProfile:(void(^)(LotusyRESTResult*, NSDictionary*))callback;


+ (void) UC004_getMyProfileBuddies:(void(^)(LotusyRESTResult*, NSDictionary*))callback;


+ (void) UC004_getMyBuddies:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) UC004_getNetworkBuddies:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) UC004_getSuggestBuddies:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) UC005_getUserProfileRanking:(int)userId
                            callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback;


+ (void) UC005_getOtherProfile:(int)userId
                      callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback;


+ (void) UC006_getProfileSettings:(void(^)(LotusyRESTResult*, NSDictionary*))callback;


+ (void) UC006_getProfileSettingAlerts:(void(^)(LotusyRESTResult*, NSDictionary*))callback;


@end
