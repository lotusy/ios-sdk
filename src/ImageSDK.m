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

@interface ImageSDK()

@end


@implementation ImageSDK

+ (void) commentImages:(int)commentId
                 start:(int)start
                  size:(int)size
              callback:(void(^)(LotusyRESTResult*, NSArray*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@%d%@%d", [ImageSDK url], @"/comment/", commentId, @"/links?start=", start, @"&size=", size];

    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(NSError* error, NSDictionary* response) {
        LotusyRESTResult* result = nil;
        NSArray* imageUrls = nil;

        if (error==nil) {
            NSString* status = [response objectForKey:@"status"];
            if ([status isEqualToString:@"success"]) {
                result = [[LotusyRESTResult alloc]initWithParam:YES statusCode:0];

                imageUrls = [response objectForKey:@"links"];
            } else {
                result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:1];
                [result addError:[response objectForKey:@"description"]];
            }
        } else {
            result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:2];
            [result addError:error.description];
        }

        callback(result, imageUrls);
    }];
}


+ (void) businessCommentImages:(int)businessId
                         start:(int)start
                          size:(int)size
                      callback:(void(^)(LotusyRESTResult*, NSArray*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@%d%@%d", [ImageSDK url], @"/business/", businessId, @"/links?start=", start, @"&size=", size];
    
    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(NSError* error, NSDictionary* response) {
        LotusyRESTResult* result = nil;
        NSArray* imageUrls = nil;
        
        if (error==nil) {
            NSString* status = [response objectForKey:@"status"];
            if ([status isEqualToString:@"success"]) {
                result = [[LotusyRESTResult alloc]initWithParam:YES statusCode:0];
                
                imageUrls = [response objectForKey:@"links"];
            } else {
                result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:1];
                [result addError:[response objectForKey:@"description"]];
            }
        } else {
            result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:2];
            [result addError:error.description];
        }
        
        callback(result, imageUrls);
    }];
}


+ (void) userCommentImages:(int)userId
                     start:(int)start
                      size:(int)size
                  callback:(void(^)(LotusyRESTResult*, NSArray*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@%d%@%d", [ImageSDK url], @"/user/", userId, @"/comment/links?start=", start, @"&size=", size];
    
    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(NSError* error, NSDictionary* response) {
        LotusyRESTResult* result = nil;
        NSArray* imageUrls = nil;
        
        if (error==nil) {
            NSString* status = [response objectForKey:@"status"];
            if ([status isEqualToString:@"success"]) {
                result = [[LotusyRESTResult alloc]initWithParam:YES statusCode:0];
                
                imageUrls = [response objectForKey:@"links"];
            } else {
                result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:1];
                [result addError:[response objectForKey:@"description"]];
            }
        } else {
            result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:2];
            [result addError:error.description];
        }
        
        callback(result, imageUrls);
    }];
}


+ (void) uploadCommentImage:(int)commentId
                       file:(NSData*)file
                   callback:(void(^)(LotusyRESTResult*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult]); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d", [ImageSDK url], @"/comment/", commentId];

    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"POST"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:file];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(NSError* error, NSDictionary* response) {
        LotusyRESTResult* result = nil;

        if (error==nil) {
            NSString* status = [response objectForKey:@"status"];
            if ([status isEqualToString:@"success"]) {
                result = [[LotusyRESTResult alloc]initWithParam:YES statusCode:0];
            } else {
                result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:1];
                [result addError:[response objectForKey:@"description"]];
            }
        } else {
            result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:2];
            [result addError:error.description];
        }

        callback(result);
    }];
}


+ (void) uploadBusinessProfileImage:(int)businessId
                               file:(NSData*)file
                           callback:(void(^)(LotusyRESTResult*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult]); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d", [ImageSDK url], @"/business/", businessId];
    
    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"POST"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:file];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(NSError* error, NSDictionary* response) {
        LotusyRESTResult* result = nil;

        if (error==nil) {
            NSString* status = [response objectForKey:@"status"];
            if ([status isEqualToString:@"success"]) {
                result = [[LotusyRESTResult alloc]initWithParam:YES statusCode:0];
            } else {
                result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:1];
                [result addError:[response objectForKey:@"description"]];
            }
        } else {
            result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:2];
            [result addError:error.description];
        }

        callback(result);
    }];
}


+ (void) uploadUserProfileImage:(NSData*)file
                       callback:(void(^)(LotusyRESTResult*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult]); }

    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:@"/user"
                                                                      method:@"POST"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:file];
    
    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(NSError* error, NSDictionary* response) {
        LotusyRESTResult* result = nil;

        if (error==nil) {
            NSString* status = [response objectForKey:@"status"];
            if ([status isEqualToString:@"success"]) {
                result = [[LotusyRESTResult alloc]initWithParam:YES statusCode:0];
            } else {
                result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:1];
                [result addError:[response objectForKey:@"description"]];
            }
        } else {
            result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:2];
            [result addError:error.description];
        }

        callback(result);
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
