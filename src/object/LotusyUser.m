//
//  LotusyUser.m
//  LotusySDK
//
//  Created by indochino on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "LotusyUser.h"

@interface LotusyUser()

@property (nonatomic) int _userId;
@property (nonatomic, strong) NSString* _externalType;
@property (nonatomic, strong) NSString* _externalId;
@property (nonatomic, strong) NSString* _userName;
@property (nonatomic, strong) NSString* _nickName;
@property (nonatomic, strong) NSString* _picture;
@property (nonatomic, strong) NSString* _description;
@property (nonatomic, strong) NSDate* _lastLogin;
@property (nonatomic) BOOL _superUser;
@property (nonatomic) BOOL _blocked;

@end


@implementation LotusyUser

static LotusyUser* _current;

+ (LotusyUser*) current {
    return _current;
}

+ (void) assignCurrent:(LotusyUser*)user {
    _current = user;
}

- (id) initWithParam:(int)userId
        externalType:(NSString*)externalType
          externalId:(NSString*)externalId
            userName:(NSString*)userName
            nickName:(NSString*)nickName
             picture:(NSString*)picture
         description:(NSString*)description
           lastLogin:(int)lastLogin
           superUser:(BOOL)superUser
             blocked:(BOOL)blocked {
    self._userId = userId;
    self._externalType = externalType;
    self._externalId = externalId;
    self._userName = userName;
    self._nickName = nickName;
    self._picture = picture;
    self._description = description;
    self._lastLogin = [[NSDate date] dateByAddingTimeInterval:-1*lastLogin];
    self._superUser = superUser;
    self._blocked = blocked;

    return self;
}

- (int) userId {
    return self._userId;
}
- (NSString*) externalType {
    return self._externalType;
}
- (NSString*) externalId {
    return self._externalId;
}
- (NSString*) userName {
    return self._userName;
}
- (NSString*) nickName {
    return self._nickName;
}
- (NSString*) picture {
    return self._picture;
}
- (NSString*) description {
    return self._description;
}
- (NSDate*) lastLogin {
    return self._lastLogin;
}
- (BOOL) superUser {
    return self._superUser;
}
- (BOOL) blocked {
    return self._blocked;
}

@end
