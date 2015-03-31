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
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        LotusyToken* token = nil;
        
        if (result.success) {
            token = [LotusyUtility parseToken:response];
            [LotusyToken assignCurrent:token];
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
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        LotusyToken* token = nil;
        
        if (result.success) {
            token = [LotusyUtility parseToken:response];
            [LotusyToken assignCurrent:token];
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
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        LotusyUser* user = nil;
        
        if (result.success) {
            user = [LotusyUtility parseUser:response];
            [LotusyUser assignCurrent:user];
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
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        LotusyUser* user = nil;
        
        if (result.success) {
            user = [LotusyUtility parseUser:response];
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
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        LotusyUser* user = nil;
        
        if (result.success) {
            user = [LotusyUtility parseUser:response];
            [LotusyUser assignCurrent:user];
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
