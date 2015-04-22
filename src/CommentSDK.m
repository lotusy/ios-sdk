//
//  CommentSDK.m
//  LotusySDK
//
//  Created by pshen on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "CommentSDK.h"
#import "LotusyConfig.h"
#import "LotusyToken.h"
#import "LotusyUtility.h"
#import "LotusyConnectorParam.h"
#import "LotusyConnector.h"

@interface CommentSDK()

@end


@implementation CommentSDK

+ (void) createComment:(LotusyLatLng*)latlng
            businessId:(int)businessId
                dishId:(int)dishId
               message:(NSString*)message
              callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    
    NSString* uri = [NSString stringWithFormat:@"%@%@", [LotusyConfig url], @"/comment"];

    NSDictionary* body = @{ @"lat" : [[NSNumber alloc]initWithDouble:latlng.lat],
                            @"lng" : [[NSNumber alloc]initWithDouble:latlng.lng],
                            @"business_id" : [[NSNumber alloc]initWithInt:businessId],
                            @"dish_id" : [[NSNumber alloc]initWithInt:dishId],
                            @"message" : message
                           };
    
    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"POST"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:body
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result, response);
    }];
}

+ (void) deleteComment:(int)commentId
              callback:(void(^)(LotusyRESTResult*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult]); }
    
    NSString* uri = [NSString stringWithFormat:@"%@%@%d", [LotusyConfig url], @"/comment/", commentId];
    
    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"DELETE"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result);
    }];
}

+ (void) dishComment:(int)dishId
               start:(int)start
                size:(int)size
            callback:(void(^)(LotusyRESTResult*, NSArray*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@%d%@%d", [LotusyConfig url], @"/comment/dish/", dishId, @"/comments?start=", start, @"&size=", size];
    
    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        NSArray* comments = nil;
        
        if (result.success) {
            comments = [response objectForKey:@"comments"];
        }
        
        callback(result, comments);
    }];
}

#pragma - pubilc / private


@end
