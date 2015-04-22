//
//  DishSDK.h
//  LotusySDK
//
//  Created by Indochino on 2015-03-31.
//  Copyright (c) 2015 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotusyRESTResult.h"
#import "LotusyLatLng.h"

@interface DishSDK : NSObject

+ (void) createDish:(int)businessId
             zhName:(NSString*)zhName
             twName:(NSString*)twName
             enName:(NSString*)enName
           callback:(void(^)(LotusyRESTResult*))callback;


+ (void) likeDish:(int)dishId
         callback:(void(^)(LotusyRESTResult*))callback;


+ (void) dislikeDish:(int)dishId
            callback:(void(^)(LotusyRESTResult*))callback;


+ (void) collectDish:(int)dishId
            callback:(void(^)(LotusyRESTResult*))callback;


+ (void) hitlistDish:(int)dishId
            callback:(void(^)(LotusyRESTResult*))callback;


+ (void) keywordDish:(int)dishId
        keywordCodes:(NSArray*)keywordCodes
            callback:(void(^)(LotusyRESTResult*))callback;


+ (void) setDishInfograph:(int)dishId
                itemValue:(int)itemValue
              portionSize:(int)portionSize
             presentation:(int)presentation
               uniqueness:(int)uniqueness
                 callback:(void(^)(LotusyRESTResult*))callback;


+ (void) businessDishes:(int)businessId
                  start:(int)start
                   size:(int)size
               callback:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) locationDishes:(LotusyLatLng*)location
                 radius:(int)radius
                isMiles:(BOOL)isMiles
                  start:(int)start
                   size:(int)size
               callback:(void(^)(LotusyRESTResult*, NSArray*))callback;


+ (void) cuisines:(void(^)(LotusyRESTResult*, NSArray*))callback;


@end
