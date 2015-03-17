//
//  LotusyToken.m
//  LotusySDK
//
//  Created by indochino on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "LotusyToken.h"

@interface LotusyToken()

@property (nonatomic) int _userId;
@property (nonatomic, strong) NSString* _accessToken;
@property (nonatomic, strong) NSString* _refreshToken;
@property (nonatomic, strong) NSString* _tokenType;
@property (nonatomic, strong) NSDate* _expiresAt;

@end


@implementation LotusyToken

static LotusyToken* _current = nil;

+ (LotusyToken*) current {
    return _current;
}

+ (void) assignCurrent:(LotusyToken*)token {
    _current = token;
}

- (id) initWithParam:(int)userId
         accessToken:(NSString*)accessToken
        refreshToken:(NSString*)refreshToken
           tokenType:(NSString*)tokenType
           expiresIn:(int)expiresIn {
    self._userId = userId;
    self._accessToken = accessToken;
    self._refreshToken = refreshToken;
    self._tokenType = tokenType;
    self._expiresAt = [[NSDate date] dateByAddingTimeInterval:expiresIn];

    return self;
}

- (int) userId {
    return self._userId;
}

- (NSString*) accessToken {
    return self._accessToken;
}

- (NSString*) refreshToken {
    return self._refreshToken;
}

- (NSString*) tokenType {
    return self._tokenType;
}

- (NSDate*) expiresAt {
    return self._expiresAt;
}

@end
