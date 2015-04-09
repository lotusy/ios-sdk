//
//  LotusyUtility.h
//  LotusySDK
//
//  Created by pshen on 2014-07-30.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotusyToken.h"
#import "LotusyLatLng.h"

@interface LotusyUtility : NSObject

+ (LotusyToken*) parseToken:(NSDictionary*)input;
+ (LotusyLatLng*) parseLatLng:(NSDictionary*)input;

+ (void) add2dict:(NSMutableDictionary*)dict
              key:(NSString*)key
            value:(NSString*)value;

@end
