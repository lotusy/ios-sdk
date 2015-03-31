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
#import "LotusyUser.h"
#import "LotusyUtility.h"
#import "LotusyConnectorParam.h"
#import "LotusyConnector.h"

@interface CommentSDK()

@end


@implementation CommentSDK

+ (void) createComment:(LotusyLatLng*)latlng
            businessId:(int)businessId
               message:(NSString*)message
              callback:(void(^)(LotusyRESTResult*, LotusyComment*))callback {
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
        LotusyComment* comment = nil;
        
        if (result.success) {
            comment = [LotusyUtility parseComment:response];
        }
        
        callback(result, comment);
    }];
}


+ (void) comment:(int)commentId
        callback:(void(^)(LotusyRESTResult*, LotusyComment*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }

    NSString* uri = [NSString stringWithFormat:@"%@%d", @"/comment/", commentId];

    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"POST"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        LotusyComment* comment = nil;

        if (result.success) {
            comment = [LotusyUtility parseComment:response];
        }

        callback(result, comment);
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


+ (void) commentLocation:(LotusyLatLng*)latlng
                  radius:(int)radius
                 isMiles:(BOOL)isMiles
                   start:(int)start
                    size:(int)size
                callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* miles = @"false";
    if (isMiles) { miles = @"true"; }
    NSString* uri = [NSString stringWithFormat:@"%@%@%f%@%f%@%d%@%@%@%d%@%d",
                     [CommentSDK url],
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
        NSMutableDictionary* comments = nil;

        if (result.success) {
            comments = [[NSMutableDictionary alloc]init];

            NSArray* commentArr = [response objectForKey:@"comments"];
            for (NSDictionary* commentDict in commentArr) {
                LotusyComment* comment = [LotusyUtility parseComment:commentDict];
                NSNumber* distance = [commentDict objectForKey:@"distance"];
                [comments setObject:comment forKey:distance];
            }
        }

        callback(result, comments);
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
        NSMutableArray* comments = nil;

        if (result.success) {
            comments = [[NSMutableArray alloc]init];

            NSArray* commentArr = [response objectForKey:@"comments"];
            for (NSDictionary* commentDict in commentArr) {
                LotusyComment* comment = [LotusyUtility parseComment:commentDict];
                [comments addObject:comment];
            }
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
        NSMutableArray* comments = nil;
        
        if (result.success) {
            comments = [[NSMutableArray alloc]init];
            
            NSArray* commentArr = [response objectForKey:@"comments"];
            for (NSDictionary* commentDict in commentArr) {
                LotusyComment* comment = [LotusyUtility parseComment:commentDict];
                [comments addObject:comment];
            }
        }
        
        callback(result, comments);
    }];
}


+ (void) createReply:(int)commentId
             message:(NSString*)message
            callback:(void(^)(LotusyRESTResult*, LotusyReply*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%d%@", [CommentSDK url], commentId, @"/reply"];

    NSDictionary* body = @{ @"comment_id" : [[NSNumber alloc]initWithInt:commentId],
                            @"message" : message,
                            @"nickname" : [LotusyUser current].nickName
                          };

    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"POST"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:body
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        LotusyReply* reply = nil;
        
        if (result.success) {
            reply = [LotusyUtility parseReply:response];
        }

        
        callback(result, reply);
    }];
}


+ (void) commentReplies:(int)commentId
                  start:(int)start
                   size:(int)size
               callback:(void(^)(LotusyRESTResult*, NSArray*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%d%@%d%@%d", [CommentSDK url], commentId, @"/replies?start=", start, @"&size=", size];

    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        NSMutableArray* replies = nil;
        
        if (result.success) {
            replies = [[NSMutableArray alloc]init];
            
            NSArray* replyArr = [response objectForKey:@"replies"];
            for (NSDictionary* replyDict in replyArr) {
                LotusyReply* reply = [LotusyUtility parseReply:replyDict];
                [replies addObject:reply];
            }
        }
        
        callback(result, replies);
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
