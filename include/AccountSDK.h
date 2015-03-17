//
//  AccountSDK.h
//  LotusySDK
//
//  Created by pshen on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotusyRESTResult.h"
#import "LotusyToken.h"
#import "LotusyUser.h"


@interface AccountSDK : NSObject

+ (void) registerAccount:(NSString*)externalType
              externalId:(NSString*)externalId
                userName:(NSString*)userName
                nickName:(NSString*)nickName
                 picture:(NSString*)picture
             description:(NSString*)description
                callback:(void(^)(LotusyRESTResult*, LotusyToken*))callback;


+ (void) login:(NSString*)externalType
    externalId:(NSString*)externalId
      callback:(void(^)(LotusyRESTResult*, LotusyToken*))callback;


+ (void) currentUserProfile:(void(^)(LotusyRESTResult*, LotusyUser*))callback;


+ (void) userProfile:(int)userId
            callback:(void(^)(LotusyRESTResult*, LotusyUser*))callback;


+ (void) updateProfile:(NSString*)userName
              nickName:(NSString*)nickName
               picture:(NSString*)picture
           description:(NSString*)description
              callback:(void(^)(LotusyRESTResult*, LotusyUser*))callback;

@end
