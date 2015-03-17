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
}
+ (LotusyUser*) parseUser:(NSDictionary*)input {
    NSNumber* userId = [input objectForKey:@"id"];
    NSString* externalType = [input objectForKey:@"external_type"];
    NSString* externalId = [input objectForKey:@"external_ref"];
    NSString* userName = [input objectForKey:@"username"];
    NSString* nickName = [input objectForKey:@"nickname"];
    NSString* picture = [input objectForKey:@"profile_pic"];
    NSString* description = [input objectForKey:@"description"];
    NSNumber* lastLogin = [input objectForKey:@"last_login"];
    NSString* superUser = [input objectForKey:@"superuser"];
    NSString* blocked = [input objectForKey:@"blocked"];

    BOOL isSuperuser = [superUser isEqualToString:@"Y"];
    BOOL isBlocked = [blocked isEqualToString:@"Y"];

    LotusyUser* user = [[LotusyUser alloc]initWithParam:[userId intValue]
                                           externalType:externalType
                                             externalId:externalId
                                               userName:userName
                                               nickName:nickName
                                                picture:picture
                                            description:description
                                              lastLogin:[lastLogin intValue]
                                              superUser:isSuperuser
                                                blocked:isBlocked];

    return user;
}
+ (LotusyBusiness*) parseBusiness:(NSDictionary*)input {
    LotusyLatLng* latlng = [LotusyUtility parseLatLng:input];
    LotusyAddress* address = [LotusyUtility parseAddress:input];
    
    NSDictionary* hoursDict = [input objectForKey:@"hours"];
    LotusyHours* hours = nil;
    if (hoursDict!=nil) {
        hours = [LotusyUtility parseHours:hoursDict];
    }

    NSDictionary* ratingDict = [input objectForKey:@"hours"];
    LotusyRating* rating = nil;
    if (ratingDict!=nil) {
        rating = [LotusyUtility parseRating:ratingDict];
    }
    
    NSNumber* businessId = [input objectForKey:@"id"];
    NSNumber* creatorId = [input objectForKey:@"user_id"];
    NSString* zhName = [input objectForKey:@"name_zh"];
    NSString* twName = [input objectForKey:@"name_tw"];
    NSString* enName = [input objectForKey:@"name_en"];
    NSString* price = [input objectForKey:@"price"];
    NSString* cashOnly = [input objectForKey:@"cash_only"];
    NSString* verified = [input objectForKey:@"verified"];
    NSString* phone = [input objectForKey:@"phone"];
    NSString* website = [input objectForKey:@"website"];
    NSString* social = [input objectForKey:@"social"];
    NSString* imageUrl = [input objectForKey:@"image"];
    NSNumber* commentCount = [input objectForKey:@"comment_count"];
    NSNumber* ratingCount = [input objectForKey:@"rating_count"];
    
    BOOL cashOnlyBool = [cashOnly isEqualToString:@"Y"];
    BOOL verifiedBool = [verified isEqualToString:@"Y"];

    LotusyBusiness* business = [[LotusyBusiness alloc]initWithParam:[businessId intValue]
                                                          creatorId:[creatorId intValue]
                                                             zhName:zhName twName:twName
                                                             enName:enName
                                                              price:price
                                                           cashOnly:cashOnlyBool
                                                           verified:verifiedBool
                                                              phone:phone
                                                            website:website
                                                             social:social
                                                           imageUrl:imageUrl
                                                       commentCount:[commentCount intValue]
                                                        ratingCount:[ratingCount intValue]
                                                           location:latlng
                                                              hours:hours
                                                            address:address
                                                             rating:rating];

    return business;
}
+ (LotusyComment*) parseComment:(NSDictionary*)input {
    LotusyLatLng* latlng = [LotusyUtility parseLatLng:input];

    NSNumber* commentId = [input objectForKey:@"id"];
    NSNumber* businessId = [input objectForKey:@"business_id"];
    NSNumber* userId = [input objectForKey:@"user_id"];
    NSString* message = [input objectForKey:@"message"];
    NSNumber* likeCount = [input objectForKey:@"like_count"];
    NSNumber* dislikeCount = [input objectForKey:@"dislike_count"];
    NSNumber* createTime = [input objectForKey:@"create_time"];
    NSNumber* replyCount = [input objectForKey:@"reply_count"];
    NSArray* imageUris = [input objectForKey:@"image_links"];
    NSString* deleted = [input objectForKey:@"is_deleted"];

    BOOL isDeleted = [deleted isEqualToString:@"Y"];
    
    LotusyComment* comment = [[LotusyComment alloc]initWithParam:[commentId intValue]
                                                      businessId:[businessId intValue]
                                                          userId:[userId intValue]
                                                        location:latlng
                                                         message:message
                                                       likeCount:[likeCount intValue]
                                                    dislikeCount:[dislikeCount intValue]
                                                      createTime:[createTime intValue]
                                                      replyCount:[replyCount intValue]
                                                         deleted:isDeleted
                                                       imageUris:imageUris];

    return comment;
}
+ (LotusyReply*) parseReply:(NSDictionary*)input {
    NSNumber* commentId = [input objectForKey:@"comment_id"];
    NSString* message = [input objectForKey:@"message"];
    NSString* nickName = [input objectForKey:@"nickname"];
    NSNumber* createTime = [input objectForKey:@"create_time"];

    LotusyReply* reply = [[LotusyReply alloc]initWithParam:[commentId intValue] message:message nickName:nickName createTime:[createTime intValue]];

    return reply;
}
+ (LotusyRating*) parseRating:(NSDictionary*)input {
    NSNumber* overall = [input objectForKey:@"overall"];
    NSNumber* food = [input objectForKey:@"food"];
    NSNumber* serv = [input objectForKey:@"serv"];
    NSNumber* env = [input objectForKey:@"env"];

    LotusyRating* rating = [[LotusyRating alloc]initWithParam:[overall doubleValue]
                                                         food:[food doubleValue]
                                                  environment:[env doubleValue]
                                                      service:[serv doubleValue]];

    return rating;
}
+ (LotusyAddress*) parseAddress:(NSDictionary*)input {
    NSString* street = [input objectForKey:@"street"];
    NSString* city = [input objectForKey:@"city"];
    NSString* state = [input objectForKey:@"state"];
    NSString* country = [input objectForKey:@"country"];
    NSString* zip = [input objectForKey:@"zip"];

    LotusyAddress* address = [[LotusyAddress alloc]initWithAddress:street city:city state:state country:country zip:zip];

    return address;
}
+ (LotusyLatLng*) parseLatLng:(NSDictionary*)input {
    NSNumber* lat = [input objectForKey:@"lat"];
    NSNumber* lng = [input objectForKey:@"lng"];

    LotusyLatLng* latlng = [[LotusyLatLng alloc]initWithLatLng:[lat doubleValue] lng:[lng doubleValue]];

    return latlng;
}
+ (LotusyHours*) parseHours:(NSDictionary*)input {
    NSString* mon = [input objectForKey:@"mon"];
    NSString* tue = [input objectForKey:@"tue"];
    NSString* wed = [input objectForKey:@"wed"];
    NSString* thu = [input objectForKey:@"thu"];
    NSString* fri = [input objectForKey:@"fri"];
    NSString* sat = [input objectForKey:@"sat"];
    NSString* sun = [input objectForKey:@"sun"];
    NSString* holiday = [input objectForKey:@"holiday"];

    LotusyHours* hours = [[LotusyHours alloc]initWithParam:mon tue:tue wed:wed thu:thu fri:fri sat:sat sun:sun holiday:holiday];

    return hours;
}


+ (void) add2dict:(NSMutableDictionary*)dict
              key:(NSString*)key
            value:(NSString*)value {
    if (value!=nil) {
        [dict setObject:value forKey:key];
    }
}

@end
