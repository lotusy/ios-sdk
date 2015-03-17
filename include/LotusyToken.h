//
//  LotusyToken.h
//  LotusySDK
//
//  Created by indochino on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotusyToken : NSObject

+ (LotusyToken*) current;

+ (void) assignCurrent:(LotusyToken*)token;

- (id) initWithParam:(int)userId
         accessToken:(NSString*)accessToken
        refreshToken:(NSString*)refreshToken
           tokenType:(NSString*)tokenType
           expiresIn:(int)expiresIn;

- (int) userId;
- (NSString*) accessToken;
- (NSString*) refreshToken;
- (NSString*) tokenType;
- (NSDate*) expiresAt;

@end
