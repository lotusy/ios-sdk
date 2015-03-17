//
//  LotusyUtility.h
//  LotusySDK
//
//  Created by pshen on 2014-07-30.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotusyToken.h"
#import "LotusyUser.h"
#import "LotusyBusiness.h"
#import "LotusyComment.h"
#import "LotusyReply.h"
#import "LotusyRating.h"
#import "LotusyAddress.h"
#import "LotusyLatLng.h"
#import "LotusyHours.h"

@interface LotusyUtility : NSObject

+ (LotusyToken*) parseToken:(NSDictionary*)input;
+ (LotusyUser*) parseUser:(NSDictionary*)input;
+ (LotusyBusiness*) parseBusiness:(NSDictionary*)input;
+ (LotusyComment*) parseComment:(NSDictionary*)input;
+ (LotusyReply*) parseReply:(NSDictionary*)input;
+ (LotusyRating*) parseRating:(NSDictionary*)input;
+ (LotusyAddress*) parseAddress:(NSDictionary*)input;
+ (LotusyLatLng*) parseLatLng:(NSDictionary*)input;
+ (LotusyHours*) parseHours:(NSDictionary*)input;

+ (void) add2dict:(NSMutableDictionary*)dict
              key:(NSString*)key
            value:(NSString*)value;

@end
