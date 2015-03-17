//
//  AccountSDK.m
//  LotusySDK
//
//  Created by pshen on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "AccountSDK.h"
#import "LotusyConfig.h"
#import "LotusyConnectorParam.h"
#import "LotusyConnector.h"
#import "LotusyUtility.h"


@interface AccountSDK()

@end


@implementation AccountSDK

+ (void) registerAccount:(NSString*)externalType
              externalId:(NSString*)externalId
                userName:(NSString*)userName
                nickName:(NSString*)nickName
                 picture:(NSString*)picture
             description:(NSString*)description
                callback:(void(^)(LotusyRESTResult*, LotusyToken*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@%@", [AccountSDK url], @"/register/", externalType];
    NSMutableDictionary* body = [[NSMutableDictionary alloc]init];
    [LotusyUtility add2dict:body key:@"id" value:externalId];
    [LotusyUtility add2dict:body key:@"username" value:userName];
    [LotusyUtility add2dict:body key:@"nickname" value:nickName];
    [LotusyUtility add2dict:body key:@"profile_pic" value:picture];
    [LotusyUtility add2dict:body key:@"description" value:description];

    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"POST"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:body
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(NSError* error, NSDictionary* response) {
        LotusyRESTResult* result = nil;
        LotusyToken* token = nil;

        if (error==nil) {
            NSString* status = [response objectForKey:@"status"];
            if ([status isEqualToString:@"success"]) {
                result = [[LotusyRESTResult alloc]initWithParam:YES statusCode:0];
                token = [LotusyUtility parseToken:response];
                [LotusyToken assignCurrent:token];
            } else {
                result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:1];
                [result addError:[response objectForKey:@"description"]];
                [LotusyToken assignCurrent:nil];
            }
        } else {
            result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:2];
            [result addError:error.description];
            [LotusyToken assignCurrent:nil];
        }

        callback(result, token);
    }];
}


+ (void) login:(NSString*)externalType
    externalId:(NSString*)externalId
      callback:(void(^)(LotusyRESTResult*, LotusyToken*))callback {
    NSString* uri = [NSString stringWithFormat:@"%@%@%@%@%@", [AccountSDK url], @"/auth/", externalType, @"/", externalId];
    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(NSError* error, NSDictionary* response) {
        LotusyRESTResult* result = nil;
        LotusyToken* token = nil;

        if (error==nil) {
            NSString* status = [response objectForKey:@"status"];
            if ([status isEqualToString:@"success"]) {
                result = [[LotusyRESTResult alloc]initWithParam:YES statusCode:0];
                token = [LotusyUtility parseToken:response];
                [LotusyToken assignCurrent:token];
            } else {
                result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:1];
                [result addError:[response objectForKey:@"description"]];
                [LotusyToken assignCurrent:nil];
            }
        } else {
            result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:2];
            [result addError:error.description];
            [LotusyToken assignCurrent:nil];
        }

        callback(result, token);
    }];
}


+ (void) currentUserProfile:(void(^)(LotusyRESTResult*, LotusyUser*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%@", AccountSDK.url, @"/profile"];
    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(NSError* error, NSDictionary* response) {
        LotusyRESTResult* result = nil;
        LotusyUser* user = nil;

        if (error==nil) {
            NSString* status = [response objectForKey:@"status"];
            if ([status isEqualToString:@"success"]) {
                result = [[LotusyRESTResult alloc]initWithParam:YES statusCode:0];
                user = [LotusyUtility parseUser:response];
                [LotusyUser assignCurrent:user];
            } else {
                result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:1];
                [result addError:[response objectForKey:@"description"]];
            }
        } else {
            result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:2];
            [result addError:error.description];
        }

        callback(result, user);
    }];
}


+ (void) userProfile:(int)userId
            callback:(void(^)(LotusyRESTResult*, LotusyUser*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@", [AccountSDK url], @"/", userId, @"/profile"];
    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(NSError* error, NSDictionary* response) {
        LotusyRESTResult* result = nil;
        LotusyUser* user = nil;
        
        if (error==nil) {
            NSString* status = [response objectForKey:@"status"];
            if ([status isEqualToString:@"success"]) {
                result = [[LotusyRESTResult alloc]initWithParam:YES statusCode:0];
                user = [LotusyUtility parseUser:response];
            } else {
                result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:1];
                [result addError:[response objectForKey:@"description"]];
            }
        } else {
            result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:2];
            [result addError:error.description];
        }
        
        callback(result, user);
    }];
}


+ (void) updateProfile:(NSString*)userName
              nickName:(NSString*)nickName
               picture:(NSString*)picture
           description:(NSString*)description
              callback:(void(^)(LotusyRESTResult*, LotusyUser*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%@", AccountSDK.url, @"/profile"];
    NSMutableDictionary* body = [[NSMutableDictionary alloc]init];
    [LotusyUtility add2dict:body key:@"username" value:userName];
    [LotusyUtility add2dict:body key:@"nickname" value:nickName];
    [LotusyUtility add2dict:body key:@"profile_pic" value:picture];
    [LotusyUtility add2dict:body key:@"description" value:description];

    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"PUT"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:body
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(NSError* error, NSDictionary* response) {
        LotusyRESTResult* result = nil;
        LotusyUser* user = nil;
        
        if (error==nil) {
            NSString* status = [response objectForKey:@"status"];
            if ([status isEqualToString:@"success"]) {
                result = [[LotusyRESTResult alloc]initWithParam:YES statusCode:0];
                user = [LotusyUtility parseUser:response];
                [LotusyUser assignCurrent:user];
            } else {
                result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:1];
                [result addError:[response objectForKey:@"description"]];
            }
        } else {
            result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:2];
            [result addError:error.description];
        }
        
        callback(result, user);
    }];
}

#pragma - pubilc / private

+ (NSString*) url {
    ENVIRONMENT environment = [LotusyConfig currentEnvironment];

    NSString* uri = @"";
    switch (environment) {
        case DEV:
            uri = @"http://local.account.lotusy.com/rest";
            break;
        case TEST:
            uri = @"http://test.account.lotusy.com/rest";
            break;
        case INT:
            uri = @"http://int.account.lotusy.com/rest";
            break;
        case STAG:
            uri = @"http://staging.account.lotusy.com/rest";
            break;
        case PROD:
            uri = @"http://account.lotusy.com/rest";
            break;
    }

    return uri;
}

@end
