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
#import "LotusyToken.h"

@implementation PageSDK


+ (void) UC001_getBusinessDishes:(int)businessId
                        callback:(void(^)(LotusyRESTResult*, NSArray*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@", [LotusyConfig url], @"/business/", businessId, @"/dishes?start=0&size=15"];
    
    LotusyConnectorParam* param = [self getDefaultParam:uri];

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
    
    LotusyConnectorParam* param = [self getDefaultParam:uri];

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
    
    LotusyConnectorParam* param = [self getDefaultParam:uri];

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
    
    LotusyConnectorParam* param = [self getDefaultParam:uri];

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
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@", [LotusyConfig url], @"/flow/dish/", dishId, @"/popularity"];
    
    LotusyConnectorParam* param = [self getDefaultParam:uri];
                                   
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result, response);
    }];
}


+ (void) UC003_getDishPreference:(int)dishId
                        callback:(void(^)(LotusyRESTResult*, NSArray*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@", [LotusyConfig url], @"/flow/dish/", dishId, @"/preference?start=0&size=10"];

    LotusyConnectorParam* param = [self getDefaultParam:uri];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        NSArray* users = nil;

        if (result.success) {
            users = [response objectForKey:@"detail"];
        }

        callback(result, users);
    }];
}


+ (void) UC003_getDishInfograph:(int)dishId
                       callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@", [LotusyConfig url], @"/flow/dish/", dishId, @"/infograph"];

    LotusyConnectorParam* param = [self getDefaultParam:uri];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        NSDictionary* detail = nil;
        
        if (result.success) {
            detail = [response objectForKey:@"detail"];
        }

        callback(result, detail);
    }];
}


+ (void) UC004_getBuddiesActivities:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@", [LotusyConfig url], @"/flow/user/", [LotusyToken current].userId , @"/activities"];

    LotusyConnectorParam* param = [self getDefaultParam:uri];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result, response);
    }];
}


+ (void) UC004_getMyProfile:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@", [LotusyConfig url], @"/flow/me/profile"];
    
    LotusyConnectorParam* param = [self getDefaultParam:uri];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result, response);
    }];
}


+ (void) UC004_getMyProfileBuddies:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@", [LotusyConfig url], @"/flow/me/buddies"];
    
    LotusyConnectorParam* param = [self getDefaultParam:uri];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result, response);
    }];
}


+ (void) UC004_getMyBuddies:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@", [LotusyConfig url], @"/flow/me/buddy/add"];
    
    LotusyConnectorParam* param = [self getDefaultParam:uri];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result, response);
    }];
}


+ (void) UC004_getNetworkBuddies:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@", [LotusyConfig url], @"/flow/me/buddy/add/network"];
    
    LotusyConnectorParam* param = [self getDefaultParam:uri];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result, response);
    }];
}


+ (void) UC004_getSuggestBuddies:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@", [LotusyConfig url], @"/flow/me/buddy/add/suggest"];
    
    LotusyConnectorParam* param = [self getDefaultParam:uri];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result, response);
    }];
}


+ (void) UC005_getUserProfileRanking:(int)userId
                            callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@", [LotusyConfig url], @"/flow/user/", userId ,@"/profile/ranking"];

    LotusyConnectorParam* param = [self getDefaultParam:uri];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result, response);
    }];
}


+ (void) UC005_getOtherProfile:(int)userId
                      callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@", [LotusyConfig url], @"/flow/user/", userId ,@"/profile"];
    
    LotusyConnectorParam* param = [self getDefaultParam:uri];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result, response);
    }];
}


+ (void) UC006_getProfileSettings:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@", [LotusyConfig url], @"/flow/me/setting"];
    
    LotusyConnectorParam* param = [self getDefaultParam:uri];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result, response);
    }];
}


+ (void) UC006_getProfileSettingAlerts:(void(^)(LotusyRESTResult*, NSArray*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@", [LotusyConfig url], @"/flow/me/setting/alerts"];
    
    LotusyConnectorParam* param = [self getDefaultParam:uri];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        NSArray* alerts = nil;

        if (result.success) {
            alerts = [response objectForKey:@"alters"];
        }

        callback(result, alerts);
    }];
}


+ (LotusyConnectorParam*) getDefaultParam:(NSString*)uri {
    return [[LotusyConnectorParam alloc]initWithParam:uri
                                               method:@"GET"
                                              headers:LotusyConfig.defaultHeaders
                                                 body:nil
                                                 file:nil];
}

@end
