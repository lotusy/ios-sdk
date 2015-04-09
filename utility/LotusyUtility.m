//
//  LotusyUtility.m
//  LotusySDK
//
//  Created by pshen on 2014-07-30.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "LotusyUtility.h"

@implementation LotusyUtility

+ (LotusyToken*) parseToken:(NSDictionary*)input {
    NSNumber* userId = [input objectForKey:@"user_id"];
    NSString* accessToken = [input objectForKey:@"access_token"];
    NSString* refreshToken = [input objectForKey:@"refresh_token"];
    NSString* tokenType = [input objectForKey:@"token_type"];
    NSNumber* expiresIn = [input objectForKey:@"expires_in"];

    LotusyToken* token = [[LotusyToken alloc]initWithParam:[userId intValue]
                                               accessToken:accessToken
                                              refreshToken:refreshToken
                                                 tokenType:tokenType
                                                 expiresIn:[expiresIn intValue]];
    return token;
}+ (LotusyLatLng*) parseLatLng:(NSDictionary*)input {
    NSNumber* lat = [input objectForKey:@"lat"];
    NSNumber* lng = [input objectForKey:@"lng"];

    LotusyLatLng* latlng = [[LotusyLatLng alloc]initWithLatLng:[lat doubleValue] lng:[lng doubleValue]];

    return latlng;
}


+ (void) add2dict:(NSMutableDictionary*)dict
              key:(NSString*)key
            value:(NSString*)value {
    if (value!=nil) {
        [dict setObject:value forKey:key];
    }
}

@end
