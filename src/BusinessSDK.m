//
//  BusinessSDK.m
//  LotusySDK
//
//  Created by pshen on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "BusinessSDK.h"
#import "LotusyConfig.h"
#import "LotusyToken.h"
#import "LotusyUtility.h"
#import "LotusyConnectorParam.h"
#import "LotusyConnector.h"

@interface BusinessSDK()

@end


@implementation BusinessSDK

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
               callback:(void(^)(LotusyRESTResult*, LotusyBusiness*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%@", [LotusyConfig url], @"/business" ];
    NSMutableDictionary* body = [[NSMutableDictionary alloc]init];
    if (latlng!=nil) {
        [body setObject:[[NSNumber alloc] initWithDouble:latlng.lat] forKey:@"lat"];
        [body setObject:[[NSNumber alloc] initWithDouble:latlng.lng] forKey:@"lng"];
    }
    if (address!=nil) {
        [LotusyUtility add2dict:body key:@"street" value:address.street];
        [LotusyUtility add2dict:body key:@"city" value:address.city];
        [LotusyUtility add2dict:body key:@"state" value:address.state];
        [LotusyUtility add2dict:body key:@"country" value:address.country];
        [LotusyUtility add2dict:body key:@"zip" value:address.zip];
    }
    if (hours!=nil) {
        NSMutableDictionary* hoursDict = [[NSMutableDictionary alloc]init];
        [LotusyUtility add2dict:hoursDict key:@"mon" value:hours.mon];
        [LotusyUtility add2dict:hoursDict key:@"tue" value:hours.tue];
        [LotusyUtility add2dict:hoursDict key:@"wed" value:hours.wed];
        [LotusyUtility add2dict:hoursDict key:@"thu" value:hours.thu];
        [LotusyUtility add2dict:hoursDict key:@"fri" value:hours.fri];
        [LotusyUtility add2dict:hoursDict key:@"sat" value:hours.sat];
        [LotusyUtility add2dict:hoursDict key:@"sun" value:hours.sun];
        [LotusyUtility add2dict:hoursDict key:@"holiday" value:hours.holiday];
        [body setObject:hoursDict forKey:@"hours"];
    }
    NSString* cashOnlyStr = @"N";
    if (cashOnly) { cashOnlyStr = @"Y"; }
    NSString* verifiedStr = @"N";
    if (verified) { verifiedStr = @"Y"; }
    [LotusyUtility add2dict:body key:@"name_zh" value:zhName];
    [LotusyUtility add2dict:body key:@"name_tw" value:twName];
    [LotusyUtility add2dict:body key:@"name_en" value:enName];
    [LotusyUtility add2dict:body key:@"price" value:price];
    [LotusyUtility add2dict:body key:@"tel" value:phone];
    [LotusyUtility add2dict:body key:@"website" value:website];
    [LotusyUtility add2dict:body key:@"social" value:social];
    
    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"POST"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:body
                                                                        file:nil];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        LotusyBusiness* business = nil;

        if (result.success) {
            business = [LotusyUtility parseBusiness:response];
        }

        callback(result, business);
    }];
}


+ (void) businessProfile:(int)businessId
                callback:(void(^)(LotusyRESTResult*, LotusyBusiness*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@", [LotusyConfig url], @"/", businessId, @"/profile"];

    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        LotusyBusiness* business = nil;

        if (result.success) {
            business = [LotusyUtility parseBusiness:response];
        }

        callback(result, business);
    }];
}


+ (void) businessLocation:(LotusyLatLng*)latlng
                   radius:(int)radius
                  isMiles:(BOOL)isMiles
                    start:(int)start
                     size:(int)size
                 callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* miles = @"false";
    if (isMiles) { miles = @"true"; }
    NSString* uri = [NSString stringWithFormat:@"%@%@%f%@%f%@%d%@%@%@%d%@%d",
                     [LotusyConfig url],
                     @"/location?lat=", latlng.lat,
                     @"&lng=", latlng.lng,
                     @"&radius=", radius,
                     @"&is_miles=", miles,
                     @"&start=", start,
                     @"&size=", size];
    
    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        NSMutableDictionary* businesses = nil;
        
        if (result.success) {
            businesses = [[NSMutableDictionary alloc]init];

            NSArray* businessArr = [response objectForKey:@"businesses"];
            for (NSDictionary* businessDict in businessArr) {
                LotusyBusiness* business = [LotusyUtility parseBusiness:businessDict];
                NSNumber* distance = [businessDict objectForKey:@"distance"];
                [businesses setObject:business forKey:distance];
            }
        }
        
        callback(result, businesses);
    }];
}


+ (void) rateBusiness:(int)businessId
              overall:(double)overall
                 food:(double)food
          environment:(double)environment
              service:(double)service
             callback:(void(^)(LotusyRESTResult*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult]); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@", [LotusyConfig url], @"/", businessId, @"/rate"];
    NSDictionary* body = @{ @"overall" : [[NSNumber alloc]initWithDouble:overall],
                            @"food" : [[NSNumber alloc]initWithDouble:food],
                            @"env" : [[NSNumber alloc]initWithDouble:environment],
                            @"serv" : [[NSNumber alloc]initWithDouble:service]
                           };

    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"POST"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:body
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result);
    }];
}


+ (void) userRating:(int)businessId
             userId:(int)userId
           callback:(void(^)(LotusyRESTResult*, LotusyRating*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@%d%@", [LotusyConfig url], @"/business/", businessId, @"/user/", userId, @"/rating"];

    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        LotusyRating* rating = nil;

        if (result.success) {
            rating = [LotusyUtility parseRating:response];
        }

        callback(result, rating);
    }];
}

#pragma - pubilc / private

+ (NSString*) url {
    ENVIRONMENT environment = [LotusyConfig currentEnvironment];
    
    NSString* uri = @"";
    switch (environment) {
        case DEV:
            uri = @"http://local.business.lotusy.com/rest";
            break;
        case TEST:
            uri = @"http://test.business.lotusy.com/rest";
            break;
        case INT:
            uri = @"http://int.business.lotusy.com/rest";
            break;
        case STAG:
            uri = @"http://staging.business.lotusy.com/rest";
            break;
        case PROD:
            uri = @"http://business.lotusy.com/rest";
            break;
    }
    
    return uri;
}

@end
