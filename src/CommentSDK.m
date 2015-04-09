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
               message:(NSString*)message
              callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }

    NSDictionary* body = @{ @"lat" : [[NSNumber alloc]initWithDouble:latlng.lat],
                            @"lng" : [[NSNumber alloc]initWithDouble:latlng.lng],
                            @"business_id" : [[NSNumber alloc]initWithInt:businessId],
                            @"message" : message
                           };
    
    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:@"/comment"
                                                                      method:@"POST"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:body
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result, response);
    }];
}


+ (void) comment:(int)commentId
        callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }

    NSString* uri = [NSString stringWithFormat:@"%@%d", @"/comment/", commentId];

    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"POST"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result, response);
    }];
}


+ (void) deleteComment:(int)commentId
              callback:(void(^)(LotusyRESTResult*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult]); }
    
    NSString* uri = [NSString stringWithFormat:@"%@%d", @"/comment/", commentId];
    
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


+ (void) likeComment:(int)commentId
            callback:(void(^)(LotusyRESTResult*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult]); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@", [CommentSDK url], @"/comment/", commentId, @"/like"];
    
    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"PUT"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result);
    }];
}


+ (void) dislikeComment:(int)commentId
               callback:(void(^)(LotusyRESTResult*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult]); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@", [CommentSDK url], @"/comment/", commentId, @"/dislike"];

    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"PUT"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result);
    }];
}

+ (void) userComments:(int)userId
                start:(int)start
                 size:(int)size
             callback:(void(^)(LotusyRESTResult*, NSArray*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@%d%@%d", [CommentSDK url], @"/user/", userId, @"comments?start=", start, @"&size=", size];

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


+ (void) businessComments:(int)businessId
                    start:(int)start
                     size:(int)size
                 callback:(void(^)(LotusyRESTResult*, NSArray*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@%d%@%d", [CommentSDK url], @"/business/", businessId, @"comments?start=", start, @"&size=", size];
    
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

+ (NSString*) url {
    ENVIRONMENT environment = [LotusyConfig currentEnvironment];
    
    NSString* uri = @"";
    switch (environment) {
        case DEV:
            uri = @"http://local.comment.lotusy.com/rest";
            break;
        case TEST:
            uri = @"http://test.comment.lotusy.com/rest";
            break;
        case INT:
            uri = @"http://int.comment.lotusy.com/rest";
            break;
        case STAG:
            uri = @"http://staging.comment.lotusy.com/rest";
            break;
        case PROD:
            uri = @"http://comment.lotusy.com/rest";
            break;
    }
    
    return uri;
}

@end
