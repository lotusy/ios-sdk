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
    NSString* uri = [NSString stringWithFormat:@"%@%@%@", [LotusyConfig url], @"/register/", externalType];
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
    NSString* uri = [NSString stringWithFormat:@"%@%@%@%@%@", [LotusyConfig url], @"/auth/", externalType, @"/", externalId];
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


+ (void) logout:(void(^)(LotusyRESTResult*))callback {
    [LotusyToken assignCurrent:nil];
    LotusyRESTResult *result = [[LotusyRESTResult alloc]initWithParam:YES statusCode:0];
    callback(result);
}


+ (void) currentUserProfile:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@", AccountSDK.url, @"/user/", [LotusyToken current].userId ,@"/profile"];
    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result, response);
    }];
}


+ (void) userProfile:(int)userId
            callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%@%d%@", [LotusyConfig url], @"/user/", userId, @"/profile"];
    LotusyConnectorParam* param = [[LotusyConnectorParam alloc]initWithParam:uri
                                                                      method:@"GET"
                                                                     headers:LotusyConfig.defaultHeaders
                                                                        body:nil
                                                                        file:nil];

    LotusyConnector* connector = [[LotusyConnector alloc]initWithParam:param];
    [connector execute:^(LotusyRESTResult* result, NSDictionary* response) {
        callback(result, response);
    }];
}


+ (void) updateProfile:(NSString*)userName
              nickName:(NSString*)nickName
               picture:(NSString*)picture
           description:(NSString*)description
              callback:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    if (LotusyToken.current == nil) { callback([LotusyRESTResult unauthResult], nil); }
    NSString* uri = [NSString stringWithFormat:@"%@%@", AccountSDK.url, @"/user/profile"];
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
        callback(result, response);
    }];
}


+ (void) userFollowings:(int)userId
                  start:(int)start
                   size:(int)size
               callback:(void(^)(LotusyRESTResult*, NSArray*))callback {
    
}


+ (void) userFollowers:(int)userId
                 start:(int)start
                  size:(int)size
              callback:(void(^)(LotusyRESTResult*, NSArray*))callback {
    
}


+ (void) userCollection:(int)userId
                  start:(int)start
                   size:(int)size
               callback:(void(^)(LotusyRESTResult*, NSArray*))callback {
    
}


+ (void) userHitlist:(int)userId
               start:(int)start
                size:(int)size
            callback:(void(^)(LotusyRESTResult*, NSArray*))callback {
    
}


+ (void) userActivities:(int)userId
                  start:(int)start
                   size:(int)size
               callback:(void(^)(LotusyRESTResult*, NSArray*))callback; {
    
}


+ (void) buddyUser:(int)userId
          callback:(void(^)(LotusyRESTResult*))callback {
    
}


+ (void) unBuddyUser:(int)userId
            callback:(void(^)(LotusyRESTResult*))callback {
    
}


+ (void) updateUserAlert:(NSString*)alertCode
                   isAdd:(BOOL)isAdd
                callback:(void(^)(LotusyRESTResult*))callback {
    
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
