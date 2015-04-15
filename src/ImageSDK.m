//
//  ImageSDK.m
//  LotusySDK
//
//  Created by pshen on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "ImageSDK.h"
#import "LotusyConfig.h"
#import "LotusyToken.h"
#import "LotusyUtility.h"
#import "LotusyConnectorParam.h"
#import "LotusyConnector.h"


@implementation ImageSDK

+ (void) uploadDishImage:(int)dishId
                    file:(NSData*)file
                callback:(void(^)(LotusyRESTResult*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult]); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d", [LotusyConfig url], @"/image/dish/", dishId];
    
    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"POST"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:file];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result);
    }];
}

+ (void) dishImages:(int)dishId
              start:(int)start
               size:(int)size
           callback:(void(^)(LotusyRESTResult*, NSArray*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@%d%@%d", [LotusyConfig url], @"/image/dish/", dishId, @"profile/links?start=", start, @"&size=", size];

    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        NSArray* imageUrls = nil;
        
        if (result.success) {
            imageUrls = [response objectForKey:@"links"];
        }

        callback(result, imageUrls);
    }];
}

#pragma - pubilc / private

+ (NSString*) url {
    ENVIRONMENT environment = [LotusyConfig currentEnvironment];
    
    NSString* uri = @"";
    switch (environment) {
        case DEV:
            uri = @"http://local.image.lotusy.com/rest";
            break;
        case TEST:
            uri = @"http://test.image.lotusy.com/rest";
            break;
        case INT:
            uri = @"http://int.image.lotusy.com/rest";
            break;
        case STAG:
            uri = @"http://staging.image.lotusy.com/rest";
            break;
        case PROD:
            uri = @"http://image.lotusy.com/rest";
            break;
    }
    
    return uri;
}

@end
