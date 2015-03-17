//
//  LotusyUser.h
//  LotusySDK
//
//  Created by indochino on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotusyUser : NSObject

+ (LotusyUser*) current;

+ (void) assignCurrent:(LotusyUser*)user;

- (id) initWithParam:(int)userId
        externalType:(NSString*)externalType
          externalId:(NSString*)externalId
            userName:(NSString*)userName
            nickName:(NSString*)nickName
             picture:(NSString*)picture
         description:(NSString*)description
           lastLogin:(int)lastLogin
           superUser:(BOOL)superUser
             blocked:(BOOL)blocked;

- (int) userId;
- (NSString*) externalType;
- (NSString*) externalId;
- (NSString*) userName;
- (NSString*) nickName;
- (NSString*) picture;
- (NSString*) description;
- (NSDate*) lastLogin;
- (BOOL) superUser;
- (BOOL) blocked;

@end
