//
//  PageSDK.m
//  LotusySDK
//
//  Created by Indochino on 2015-03-30.
//  Copyright (c) 2015 lotusy. All rights reserved.
//

#import "PageSDK.h"
#import "LotusyConfig.h"
#import "LotusyConnectorParam.h"
#import "LotusyConnector.h"

@implementation PageSDK


+ (void) UC001_getBusinessDishes:(int)businessId
                        callback:(void(^)(LotusyRESTResult*, NSArray*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@", [LotusyConfig url], @"/business/", businessId, @"/dishes?start=0&size=15"];

    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        NSArray* dishes = nil;

        if (result.success) {
            dishes = [response objectForKey:@"dishes"];
        }

        callback(result, dishes);
    }];
}


+ (void) UC001_getDishDetails:(int)dishId
                     callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@", [LotusyConfig url], @"/flow/dish/", dishId, @"/detail"];
    
    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        NSDictionary* dish = nil;

        if (result.success) {
            dish = [response objectForKey:@"dish"];
        }

        callback(result, dish);
    }];
}


+ (void) UC002_getBuddiesDishActivities:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@", [LotusyConfig url], @"/flow/user/followings/dishes?start=0&size=15"];

    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        NSDictionary* dishes = nil;

        if (result.success) {
            dishes = [response objectForKey:@"activities"];
        }

        callback(result, dishes);
    }];
}


+ (void) UC002_getNearByFoods:(double)lat
                          lng:(double)lng
                       radius:(int)radius
                     callback:(void(^)(LotusyRESTResult*, NSArray*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@%f%@%f%@%d%@", [LotusyConfig url], @"/dish/location?lat=", lat, @"&lng=", lng, @"&radius=", radius, @"&start=0&size=30"];

    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        NSArray* dishes = nil;
        
        if (result.success) {
            dishes = [response objectForKey:@"dishes"];
        }

        callback(result, dishes);
    }];
}


+ (void) UC002_getDishPopularity:(int)dishId
                        callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    
}


+ (void) UC003_getDishPreference:(int)dishId
                           start:(int)start
                            size:(int)size
                        callback:(void(^)(LotusyRESTResult*, NSArray*))callback {
    
}


+ (void) UC003_getDishInfograph:(int)dishId
                       callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    
}


+ (void) UC004_getBuddiesActivities:(void(^)(LotusyRESTResult*, NSArray*))callback {
    
}


+ (void) UC004_getMyProfile:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    
}


+ (void) UC004_getMyProfileBuddies:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    
}


+ (void) UC004_getMyBuddies:(void(^)(LotusyRESTResult*, NSArray*))callback {
    
}


+ (void) UC004_getNetworkBuddies:(void(^)(LotusyRESTResult*, NSArray*))callback {
    
}


+ (void) UC004_getSuggestBuddies:(void(^)(LotusyRESTResult*, NSArray*))callback {
    
}


+ (void) UC005_getUserProfileRanking:(int)userId
                            callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    
}


+ (void) UC005_getOtherProfile:(int)userId
                      callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    
}


+ (void) UC006_getProfileSettings:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    
}


+ (void) UC006_getProfileSettingAlerts:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    
}


@end
